library(testthat)
source("../../src/split_data.r")

# Example dataset
my_data <- data.frame(x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                    y = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                    z = c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000))

test_that("`split_data` should return a training set with 3 rows", {
  expect_equal(nrow(split_data(my_data, 0.5, "train")), 5)
})

test_that("`split_data` should return a training set with 6 rows", {
  expect_equal(nrow(split_data(my_data, 0.6, "train")), 6)
})

test_that("`split_data` should return a testing set with 3 rows", {
  expect_equal(nrow(split_data(my_data, 0.7, "test")), 3)
})

