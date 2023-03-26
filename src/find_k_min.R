#' Find the k value that minimize RMSE
#'
#' Return a list of outputs
#' 
#' @param training A dataframe that we are going to fit the KNN model on 
#'
#' @return a list of outputs:
#' First one would be the recipe
#' Second one would be the knn regression model
#' Third one would be the k value which minimize the RMSE
#' Last one would be a tibble of the results: contains k values and corresponding RMSE
#'
#' @export
#'
#' @examples
#' find_k_min(training) 

library(tidymodels)
library(tidyverse)
library(kknn)
library(here)
find_k_min <- function(input_training_path, output_results_path){
  training <- read.csv(input_training_path)
  if (!is.data.frame(training)) {
    stop("`training` should be a data frame")
  }
  recipe <- recipe(cnt ~ windspeed+atemp+season, data = training) %>%    
    step_scale(all_predictors()) %>%  
    step_center(all_predictors()) 
  
  knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%  # tune the K value
    set_engine("kknn") %>%    # use the K-nearest neighbors algorithm for our model 
    set_mode("regression")    # use regression for our model   
  
  vfold <- vfold_cv(training, v = 5, strata = cnt)   # seperate the data into five random groups
  gridvals <- tibble(neighbors = seq(from = 1, to = 20))  #create the list of k values we are going to try
  # create a workflow
  wkflw <- workflow() %>%                              
    add_recipe(recipe) %>%         # add the recipe into the workflow   
    add_model(knn_spec)            # add the model into the workflow         
  results <- wkflw  %>%
    tune_grid(resamples = vfold, grid = gridvals)%>%
    collect_metrics() %>%          
    filter(.metric == "rmse")%>%      # filter out only the rows with RMSE metric 
    arrange(mean)                     # arrange the rows in ascending order of RMSE
  write.csv(results, file = output_results_path, row.names = FALSE) # hardcoded path because this function gets called in RMD and Tests, which would result in root folder being different each time
  top_ks = head(results, 5)
  
  kmin <- results %>%           # find the k value with lowest RMSE
    slice(1) %>%          # slice the first row of the dataframe to get the row with the lowest RMSE
    pull(neighbors)       # pulls the number of neighbors in the neighbors column
  return(list(recipe,knn_spec,kmin, results))
}