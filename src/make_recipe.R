#' Create a recipe to scale and center the predictor variables
#'
#' Create a recipe that scale and center the specified predictor variables
#' 
#' @param target A quoted column name to act as a target variable
#' @param predictor1 The first predictor variable
#' @param predictor2 The second predictor variable
#' @param predictor3 The third predictor variable
#' @param training A training dataset
#'
#' @return A recipe that scale and center the specified predictor variables
#'
#' @export
#'
#' @examples
#' make_recipe(weight,sex,age,grade,training_data) 

library(tidymodels)
library(tidyverse)
make_recipe <- function(target, predictor1,predictor2,predictor3, training){
  if (!is.data.frame(training)) {
    stop("`training` should be a data frame")
  }
  
  recipe <- recipe(target ~ predictor1 + predictor2 + predictor3, data = training) %>%    
    step_scale(all_predictors()) %>%  
    step_center(all_predictors())
  
  return (recipe)
}
