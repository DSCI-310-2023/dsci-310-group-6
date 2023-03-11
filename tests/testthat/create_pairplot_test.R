library(testthat)
source("src/create_pairplot.R")

# Create a test dataset
test_data <- iris[,1:4]

# Test that the function creates a pairplot with the correct data
test_that("pairplot uses correct data", {
  test_plot <- create_pairplot(test_data)
  expect_equal(test_plot$data, test_data)
})


# Test that the function creates a pairplot with the correct title
test_that("pairplot has the correct title", {
  expected_title <- "Flower Pairplot"
  test_plot <- create_pairplot(test_data, plot_title = expected_title)
  expect_equal(test_plot$title, expected_title)
})