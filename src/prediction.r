#' Make prediction and find predicted RMSE
#'
#' Return the predicted RMSE
#' 
#' @param kmin An integer representing the best k value we found before
#' @param recipe A list representing the recipe we defined before
#' @param training A dataframe that we are going to fit the KNN model on 
#' @param testing A dataframe that we are going to test the KNN model 
#'
#' @return a double representing the predicted RMSE
#'
#' @export
#'
#' @examples
#' prediction(6,recipe,training,testing)

library(tidymodels)
library(tidyverse)
prediction <- function(kmin,recipe,training,testing){
  if (!is.data.frame(training) | !is.data.frame(testing)) {
    stop("`training` and `testing` should both be data frames")
  }
  else if (!is_list(recipe)) {
    stop("`recipe` should be a list")
  }
  else if (!is_integer(kmin)){
    stop("`kmin` should be an integer")
  }
  
  # plug in the best k value that we found
  knn_spec_2 <- nearest_neighbor(weight_func = "rectangular", neighbors = kmin) %>%      
    set_engine("kknn") %>%      
    set_mode("regression")
  
  knn_fit <- workflow() %>%      
    add_recipe(recipe) %>%         # add the same recipe above    
    add_model(knn_spec_2) %>%      # add the new model with the best k-value that we found
    fit(data = training)           # fit the training data
  
  predictions <- knn_fit %>%                # fit the workflow  
    predict(testing) %>%       # predict the daily count for each observation in the test set
    bind_cols(testing)         # put the column with all the predictions into the test data frame
  
  # find the predicted RMSE
  summary <- predictions %>%
    metrics(truth = cnt, estimate = .pred) %>%   
    filter(.metric == "rmse")%>%                       
    pull(.estimate)                                     
  
  return (summary)
}

