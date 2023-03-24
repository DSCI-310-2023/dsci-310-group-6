#' Reads data and unselect the specified columns
#'
#' Return the data frame without the specified columns from the file_path
#'
#' @param file_path A quoted path to the data file
#' @param cols A list of quoted column name that we want to unselect
#'
#' @return A data frame excluding the specified columns
#'
#' @export
#'
#' @examples
#' read_data("read_data_helper.csv", c("w","x"))

library(tidyverse)

read_data <- function(file_path, cols = NULL) {
  if(!is.character(file_path)) {
    stop("`read_data` expects a quoted path of the data file as the first input")
  } 
  else if(!is.character(file_path) & !is.null(cols)) {
    stop("`read_data` expects either a list of unquoted column names as the second input")
  }
  
  data <- read.csv(file_path, sep=',', header = TRUE)
  if (!is.null(cols)) {
    data <- data[, !(names(data) %in% cols)]
  }
  write.csv(data, file = "data/clean_data.csv", row.names = FALSE)
  return(data)
}
