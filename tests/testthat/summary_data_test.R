

library(testthat)
source("../../src/summary_data.R")

# Reading data frame to help testing
file_path <- "summary_data_helper.csv"



# Example dataset
my_data <- data.frame(x = c(1, 2, 3, 4, 5),
                      y = c(10, 20, 30, 40, 50),
                      z = c(100, 200, 300, 400, 500))

# Test that the function return the right max
test_that("`summary_data` should return 50", {
  expect_equal(get_max(my_data, "y"), 50)
})

# Test that the function return the right min
test_that("`summary_data` should return 100", {
  expect_equal(get_min(my_data, "z"), 100)
})

# Test that the function return the right median
test_that("`summary_data` should return 100", {
  expect_equal(get_med(my_data, "x"), 3)
})

# Test that the function handles exception when number passed for "column name" 
# and random string is passed for data
test_that("`summary_data` should return an error when incorrect types 
are passed to `training` arguments", {
  expect_error(get_med("my_data", 3))
})

