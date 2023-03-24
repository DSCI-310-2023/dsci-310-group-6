library(testthat)
source("../../src/create_elbow_plot.r")
source("../../src/find_k_min.r")

data <- read.csv("../../data/day.csv", sep=',', header = TRUE)
training <- sample_n(data, nrow(data)*0.5, replace = FALSE)
results <- find_k_min(training)[[4]]

# Test that the output image has correct title
test_that("`create_elbow_plot` should have title 'K Neighbours vs RMSE'", {
  elbow_plot <- create_elbow_plot(results)
  expect_equal(elbow_plot$label$title, "K Neighbours vs RMSE")
})

test_that("`create_elbow_plot` should throw an error when incorrect types 
are passed to `results` arguments", {
  expect_error(create_elbow_plot(hi))
})
