# testthat
library(testthat)
source("../../src/read_data.r")

file_path <- "read_data_helper.csv"

# Test that the function return the right data frame
test_that("`read_data` should return a data frame", {
  expect_is(read_data(file_path, "y"), "data.frame")
})

# Test that the function return the right data frame
test_that("`read_data` returns a dataframe with 2 columns", {
  expect_equal(ncol(read_data(file_path,c("w","x"))), 2)
})

test_that("`read_data` should throw an error when incorrect types 
are passed to `file_path` and `cols` arguments", {
  expect_error(count_classes(hi, "y"))
  expect_error(count_classes(file_path, y))
})