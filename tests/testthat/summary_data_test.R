library(testthat)
source("../../src/summary_data.R")

# Example dataset
my_data <- data.frame(x = c(1, 2, 3, 4, 5),
                      y = c(10, 20, 30, 40, 50),
                      z = c(100, 200, 300, 400, 500))

test_that("`summary_data` should return 50", {
  expect_equal(get_max(my_data, "y"), 50)
})

test_that("`summary_data` should return 100", {
  expect_equal(get_min(my_data, "z"), 100)
})

test_that("`summary_data` should return 100", {
  expect_equal(get_med(my_data, "x"), 3)
})

