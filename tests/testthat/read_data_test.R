# testthat
library(testthat)
source("../../src/read_data.r")

file_path <- "../../data/day.csv"

# Test that the function returns a data frame
test_that("`read_data` should return a data frame", {
  expect_is(read_data(file_path), "data.frame")
})

# Test that the function returns the right data frame with 10 columns
test_that("`read_data` returns a dataframe with 2 columns", {
  expect_equal(ncol(read_data(file_path)), 10)
})

# `read_data` should throw an error when incorrect types are passed to `file_path` and `cols` arguments"
test_that("`read_data` should throw an error when incorrect types 
are passed to `file_path` and `cols` arguments", {
  expect_error(count_classes(hi))
})