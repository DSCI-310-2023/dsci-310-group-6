# testthat
library(testthat)
library(here)
source(here('src/read_data.r'))

file_path <- here('data/day.csv')


# Test that the function returns a data frame
test_that("`read_data` should return a data frame", {
  expect_is(read_data(file_path, c("instant", "dteday", "yr", "holiday", "casual", "registered")), "data.frame")
})

# Test that the function returns the right data frame with 10 columns
test_that("`read_data` returns a dataframe with 2 columns", {
  expect_equal(ncol(read_data(file_path,c("instant", "dteday", "yr", "holiday", "casual", "registered"))), 10)
})

# `read_data` should throw an error when incorrect types are passed to `file_path` and `cols` arguments"
test_that("`read_data` should throw an error when incorrect types 
are passed to `file_path` and `cols` arguments", {
  expect_error(count_classes(hi, c("instant", "dteday", "yr", "holiday", "casual", "registered")))
  expect_error(count_classes(file_path, y))
})