library(testthat)
source("../../src/split_data.r")

data <- read.csv("../../data/day.csv")

# Test that the function return the right row number of the dataset split
test_that("`split_data` should return a training set with 511 rows", {
  expect_equal(nrow(split_data(data, 0.7, "train")), 511)
})

# Test that the function return the right row number of the dataset split
test_that("`split_data` should return a testing set with 220 rows", {
  expect_equal(nrow(split_data(data, 0.7, "test")), 220)
})


test_that("`split_data` should throw an error when incorrect types 
are passed to `data` and `prop` and `train_test` arguments", {
  expect_error(split_data(hi, 0.6, "train"))
  expect_error(split_data(data, 1, "train"))
  expect_error(split_data(data, 0.6, "hi"))
})