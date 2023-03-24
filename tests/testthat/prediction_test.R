library(testthat)
source("../../src/prediction.r")

data <- read.csv("../../data/day.csv", sep=',', header = TRUE)
training <- sample_n(data, nrow(data)*0.8, replace = FALSE)
testing <- anti_join(data, training)
recipe <- recipe(cnt ~ windspeed+atemp+season, data = training) %>%    
  step_scale(all_predictors()) %>%  
  step_center(all_predictors()) 
kmin = as.integer(6)


# Test that the function return a double
test_that("`prediction` should return a double", {
  expect_true(is_double(prediction(kmin,recipe,training,testing)))
})

# `prediction` should throw an error when incorrect types are passed to `kmin`, `recipe`, `training` and `testing` arguments"
test_that("`prediction` should throw an error when incorrect types 
are passed to `kmin`, `recipe`, `training` and `testing` arguments", {
  expect_error(prediction(2.5,recipe,training,testing))
  expect_error(prediction(kmin,hi,training,testing))
  expect_error(prediction(kmin,recipe,hi,testing))
  expect_error(prediction(kmin,recipe,training,hi))
})
