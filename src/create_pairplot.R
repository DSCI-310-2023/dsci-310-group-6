library(ggplot2)
library(GGally)

create_pairplot <- function(data, plot_title = NULL) {
  plot <- ggpairs(data = data, title = plot_title )
  
  return(plot)
}