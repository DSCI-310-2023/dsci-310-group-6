library(testthat)
source("../../src/summary_data.R")

# Reading data frame to help testing
file_path <- "summary_data_helper.csv"


# Example dataset
my_data <- read.csv(file_path, sep=',', header = TRUE)

test_that("`summary_data` should return 50", {
  expect_equal(get_max(my_data, "y"), 50)
})

test_that("`summary_data` should return 100", {
  expect_equal(get_min(my_data, "z"), 100)
})

test_that("`summary_data` should return 100", {
  expect_equal(get_med(my_data, "x"), 3)
})

