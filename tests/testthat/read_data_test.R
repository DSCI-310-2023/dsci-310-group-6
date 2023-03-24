# testthat
library(testthat)
source("../../src/read_data.r")

file_path <- "../../data/day.csv"

# Test that the function return the right data frame
test_that("`read_data` should return a data frame", {
  expect_is(read_data(file_path, c("instant", "dteday", "yr", "holiday", "casual", "registered")), "data.frame")
})

# Test that the function return the right data frame
test_that("`read_data` returns a dataframe with 2 columns", {
  expect_equal(ncol(read_data(file_path,c("instant", "dteday", "yr", "holiday", "casual", "registered"))), 10)
})

test_that("`read_data` should throw an error when incorrect types 
are passed to `file_path` and `cols` arguments", {
  expect_error(count_classes(hi, c("instant", "dteday", "yr", "holiday", "casual", "registered")))
  expect_error(count_classes(file_path, y))
})