
library(testthat)


get_max <- function(data, column_name) {
  max_value <- max(data[[column_name]])
  return(max_value)
}

get_min <- function(data, column_name) {
  min_value <- min(data[[column_name]])
  return(min_value)
}

get_med <- function(data, column_name) {
  med_value <- median(data[[column_name]])
  return(med_value)
}



