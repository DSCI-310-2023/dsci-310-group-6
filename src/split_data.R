# Author: Jialu Jin
# Date: 2023-03-10

"This script splits the data into training and testing sets.

Usage: split_data.R
"

library(dplyr)

split_data <- function(data,prop,train_test) {
  training <- sample_n(data, nrow(data)*prop, replace = FALSE)
  testing <- anti_join(data, training)
  
  if (train_test == "train") {
    return (training)
  }
  else if (train_test == "test") {
    return(testing)
  }
}