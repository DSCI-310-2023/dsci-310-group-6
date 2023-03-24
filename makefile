# author: Davis Li
# date: 2023-03-24

# generate clean data

data/clean_data.csv: src/read_data.R data/day.csv
	Rscript -e 'source("src/read_data.R"); read_data("data/day.csv",c("instant", "dteday", "yr", "holiday", "casual", "registered"))'
	
# split data into training and testing

data/training_data.csv data/testing_data.csv: src/split_data.R data/clean_data.csv
	Rscript -e 'source("src/split_data.R"); split_data(read.csv("data/clean_data.csv"),0.8, "train")'
	
# generate rmse results

data/rmse_results.csv: src/find_k_min.R data/training_data.csv
	Rscript -e 'source("src/find_k_min.R"); find_k_min(read.csv("data/training_data.csv"))'
	
# generate correlation plot figure

results/correlation_plot.png: src/create_pairplot.R data/clean_data.csv
	Rscript -e 'source("src/create_pairplot.R"); create_pairplot(read.csv("data/clean_data.csv"), "Pairplot of Bike Share Data Attributes")'
	
# generate elbow plot figure

results/elbow_plot.png: src/create_elbow_plot.R data/rmse_results.csv
	Rscript -e 'source("src/create_elbow_plot.R"); create_elbow_plot(as_tibble(read.csv("data/rmse_results.csv")))'