library(testthat)
library(here)
source(here("src/create_elbow_plot.r"))
source(here("src/find_k_min.r"))

results <- here('data/rmse_results.csv')

# Test that the output image has correct title
test_that("`create_elbow_plot` should have title 'K Neighbours vs RMSE'", {
  elbow_plot <- create_elbow_plot(results, NULL)
  expect_equal(elbow_plot$label$title, "K Neighbours vs RMSE")
})

# `create_elbow_plot` should throw an error when incorrect types are passed to `results` arguments"
test_that("`create_elbow_plot` should throw an error when incorrect types 
are passed to `results` arguments", {
  expect_error(create_elbow_plot(hi, NULL))
})
