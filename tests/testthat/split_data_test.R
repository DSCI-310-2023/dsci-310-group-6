library(testthat)
source("../../src/split_data.r")

data <- read.csv("split_data_helper.csv")

test_that("`split_data` should return a training set with 3 rows", {
  expect_equal(nrow(split_data(data, 0.5, "train")), 5)
})

test_that("`split_data` should return a training set with 6 rows", {
  expect_equal(nrow(split_data(data, 0.6, "train")), 6)
})

test_that("`split_data` should return a testing set with 3 rows", {
  expect_equal(nrow(split_data(data, 0.3, "test")), 7)
})

test_that("`split_data` should throw an error when incorrect types 
are passed to `data` and `prop` and `train_test` arguments", {
  expect_error(split_data(hi, 0.6, "train"))
  expect_error(split_data(data, 1, "train"))
  expect_error(split_data(data, 0.6, "hi"))
})