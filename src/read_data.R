# Author: Jialu Jin
# Date: 2023-03-10

"This script reads a CSV file from a specified directory, sets the header to true, and unselects specified columns.

Usage: read_data.R --file_path=<file_path> --cols=<cols>

Options:
--file_path=<file_path>   Path to the data file
--cols=<cols>             Comma-separated list of columns to exclude from the data frame
"

library(tidyverse)

read_data <- function(file_path, cols = NULL) {
  data <- read.csv(file_path, sep=',', header = TRUE)
  if (!is.null(cols)) {
    data <- data[, !(names(data) %in% cols)]
  }
  
  return(data)
}
