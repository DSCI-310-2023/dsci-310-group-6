library(here)

# helper function to write a dummy dataset csv based on the iris dataset
write.csv(iris[,1:4], file = here('tests/testthat/iris-dummy.csv'))