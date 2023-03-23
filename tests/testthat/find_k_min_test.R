library(testthat)
source("../../src/find_k_min.r")

data <- read.csv("../../data/day.csv", sep=',', header = TRUE)
training <- sample_n(data, nrow(data)*0.5, replace = FALSE)


# Test that the function return a list
test_that("`fin_k_min` should return a list", {
  expect_true(is_list(find_k_min(training)))
})

test_that("`fin_k_min` should throw an error when incorrect types 
are passed to `training` arguments", {
  expect_error(fin_k_min(hi))
})

