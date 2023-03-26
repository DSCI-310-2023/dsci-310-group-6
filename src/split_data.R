#' Splits the input data into training and testing sets.
#'
#' When the third input is "train": 
#'  return the training set, which has (prop*total_number_of_rows_in_data) rows
#' When the third input is "test": 
#'  return the testing set, which has ((1-prop)*total_number_of_rows_in_data) rows
#'
#' @param data A input dataframe
#' @param prop The proportion of data to be split into training set (<1)
#' @param train_test A string indicating which set to return
#'
#' @return A data frame of training or testing set based on the third input
#'
#' @export
#'
#' @examples
#' split_data(input_path,0.6,"train", output_train_path, output_test_path) 

library(dplyr)
library(here)

split_data <- function(input_path,prop,train_test, output_train_path = NULL, output_test_path = NULL) {
  data <- read.csv(input_path)
  if (!is.data.frame(data)) {
    stop("`input_path` should be a data frame")
  }
  else if(!is.numeric(prop) | prop >= 1) {
    stop("`split_data` expects a number smaller than 1 as second input")
  } 
  else if(! train_test %in% c("train","test")) {
    stop("`split_data` expects either 'train' or 'test' as third input")
  }
  
  training <- sample_n(data, nrow(data)*prop, replace = FALSE)
  testing <- anti_join(data, training)
  if (!is.null(output_train_path)) {
    write.csv(training, file = here(output_train_path), row.names = FALSE)
  }
  if (!is.null(output_test_path)) {
    write.csv(testing, file = here(output_test_path), row.names = FALSE)
  }
  
  if (train_test == "train") {
    return (training)
  }
  else if (train_test == "test") {
    return(testing)
  }
}
