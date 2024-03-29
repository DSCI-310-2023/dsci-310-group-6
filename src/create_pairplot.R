#' Generates a pairplot plotting a scatter chart 
#' and showing correlation between attributes. Also allows a title to be placed
#'
#' Save the pairplot in the results folder
#'
#' @param data A dataframe we are going to use
#' @param plot_title A string representing the title of the plot we want
#'
#' @return A png file of the pairplot
#'
#' @export
#'
#' @examples
#' create_pairplot(data, "pairplot")

library(ggplot2)
library(GGally)
library(here)

create_pairplot <- function(input_path, output_path = NULL, plot_title = NULL) {
  data <- read.csv(input_path)
  if (!is.data.frame(data)) {
    stop("`data` should be a data frame")
  }
  else if (!is.null(plot_title) & !is.character(plot_title)) {
    stop("`plot_title` should either be NULL or a character") 
  }
  
  correlation_plot <- ggpairs(data = data, title = plot_title )
  if (!is.null(output_path)) {
    ggsave("correlation_plot.png",plot = correlation_plot, device="png", path= here(output_path), width = 12, height = 10)
    pdf(NULL) 
  }
  
  return(correlation_plot)
}
