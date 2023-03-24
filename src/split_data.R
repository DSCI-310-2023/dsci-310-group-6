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
#' split_data(data,0.6,"train") 

library(dplyr)

split_data <- function(data,prop,train_test) {
  if (!is.data.frame(data)) {
    stop("`data` should be a data frame")
  }
  else if(!is.numeric(prop) | prop >= 1) {
    stop("`split_data` expects a number smaller than 1 as second input")
  } 
  else if(! train_test %in% c("train","test")) {
    stop("`split_data` expects either 'train' or 'test' as third input")
  }
  
  training <- sample_n(data, nrow(data)*prop, replace = FALSE)
  testing <- anti_join(data, training)
  write.csv(training, file = "data/training_data.csv", row.names = FALSE)
  write.csv(testing, file = "data/testing_data.csv", row.names = FALSE)
  if (train_test == "train") {
    return (training)
  }
  else if (train_test == "test") {
    return(testing)
  }
}
