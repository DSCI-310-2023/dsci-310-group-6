library(testthat)

# Example dataset
my_data <- data.frame(x = c(1, 2, 3, 4, 5),
                      y = c(10, 20, 30, 40, 50),
                      z = c(100, 200, 300, 400, 500))

# Get the maximum value of the 'y' column
expect_equal(get_max(my_data, "y"), 50)
expect_equal(get_min(my_data, "z"), 100)
expect_equal(get_med(my_data, "x"), 3)

