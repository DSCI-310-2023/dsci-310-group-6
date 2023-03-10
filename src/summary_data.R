# Author: Linda Huang
# Date: 2023-03-10

"This script take one dataframe and one column name to produce the mean, max, min of the column 

Usage: summary_dats.R --dataframe=<data> --cols=<cols>

Options:
--dataframe=<data>   The data frame
--cols=<cols>        Comma-separated list of columns to calculate for mean, max, min value
"


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



