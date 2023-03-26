library(testthat)
library(here)

path_k_min <- source('../../src/find_k_min.R')
source(here('src/find_k_min.R'))

path_data <- here('data/day.csv')
data <- read.csv(path_data, sep=',', header = TRUE)
training <- sample_n(data, nrow(data)*0.5, replace = FALSE)

# Test that the function return a list
test_that("`find_k_min` should return a list", {
  expect_true(is_list(find_k_min(training)))
})

# Test that the first element of the output should be a recipe object
test_that("`find_k_min` should return a recipe for first object", {
  expect_s3_class(find_k_min(training)[[1]], "recipe")
})

# Test that the second element of the output should be a model specification object
test_that("`find_k_min` should return a model spec object for second object", {
  expect_s3_class(find_k_min(training)[[2]], "model_spec")
})

# Test that the third element of the output should be an integer
test_that("`find_k_min` should return an integer for third object", {
  expect_is(find_k_min(training)[[3]], "integer")
})

# Test that the fourth element of the output should be a tibble
test_that("`find_k_min` should return a tibble for fourth object", {
  expect_s3_class(find_k_min(training)[[4]], "tbl_df")
})