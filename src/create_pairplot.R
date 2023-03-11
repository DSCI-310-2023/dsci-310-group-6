# Author: Davis Li
# Date: 2023-03-11

"This script takes a dataset and generates a pairplot plotting a scatter chart 
and showing correlation between attributes. Also allows a title to be placed

Usage: create_pairplot.R
"


library(ggplot2)
library(GGally)

create_pairplot <- function(data, plot_title = NULL) {
  plot <- ggpairs(data = data, title = plot_title )
  
  return(plot)
}