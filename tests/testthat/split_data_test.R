library(testthat)
source("../../src/split_data.r")

data <- read.csv("split_data_helper.csv")

# Test that the function return the right row number of the dataset split
test_that("`split_data` should return a training set with 3 rows", {
  expect_equal(nrow(split_data(data, 0.5, "train")), 5)
})

# Test that the function return the right row number of the dataset split
test_that("`split_data` should return a training set with 6 rows", {
  expect_equal(nrow(split_data(data, 0.6, "train")), 6)
})

# Test that the function return the right row number of the dataset split
test_that("`split_data` should return a testing set with 3 rows", {
  expect_equal(nrow(split_data(data, 0.3, "test")), 7)
})
