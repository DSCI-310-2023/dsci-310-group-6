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
