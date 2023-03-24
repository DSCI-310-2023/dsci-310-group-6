#' Create elbow plot of RMSE against k values
#'
#' Save the elbow plot in the results folder
#'
#' @param results A tibble containing k values and corresponding RMSE
#'
#' @return A png file of the elbow plot
#'
#' @export
#'
#' @examples
#' read_data("read_data_helper.csv", c("w","x"))
library(tidyverse)

create_elbow_plot <- function(results){
  if (!is_tibble(results)){
    stop("`results` should be a tibble")
  }

  elbow_plot <- ggplot(results, aes(x = neighbors, y = mean)) +    # plot K vs RMSE 
  geom_point() + geom_line() +                        # specify that each point in the graph will be connected by lines
  labs(x = "Neighbors", y = "Mean RMSE") +    
  scale_x_continuous(breaks = seq(0, 20, by = 1)) +   
  ggtitle("K Neighbours vs RMSE") +                   # give the graph a title
  theme(axis.title.x = element_text(size = 15),       
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        plot.title = element_text(size = 20, hjust = 0.5))
  ggsave("elbow_plot.png",device="png", path="results", width = 8, height = 8)
  return(elbow_plot)
}