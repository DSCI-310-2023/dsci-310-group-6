library(testthat)
library(here)
source(here("src/create_pairplot.R"))

# Create a test dataset
test_data <- iris[,1:4]

# Test that `create_pairplot` creates a pairplot with the correct title
test_that("`create_pairplot` should have correct title 'Flower Pairplot'", {
  expected_title <- "Flower Pairplot"
  test_plot <- create_pairplot(test_data, plot_title = expected_title)
  expect_equal(test_plot$title, expected_title)
})

# `create_elbow_plot` should throw an error when incorrect types are passed to `data` 
# and `plot_title` arguments"
test_that("`create_elbow_plot` should throw an error when incorrect types 
are passed to `results` arguments", {
  expect_error(create_pairplot(test_data, hi))
  expect_error(create_pairplot(hi, "hi"))            
})
