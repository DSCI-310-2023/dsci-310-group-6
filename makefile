# author: Davis Li
# date: 2023-03-24

# make all to run everything together
all: data/clean_data.csv data/training_data.csv data/testing_data.csv results/correlation_plot.png data/rmse_results.csv results/elbow_plot.png doc/bike_share_analysis.html

# generate clean data

data/clean_data.csv: src/clean_data.R data/day.csv
	Rscript -e 'source("src/clean_data.R"); clean_data("data/day.csv", "data/clean_data.csv", c("instant", "dteday", "yr", "holiday", "casual", "registered"))'
	
# taking clean data and splitting data into training and testing

data/training_data.csv data/testing_data.csv: src/split_data.R data/clean_data.csv
	Rscript -e 'source("src/split_data.R"); split_data("data/clean_data.csv",0.8, "train", "data/training_data.csv", "data/testing_data.csv")'
	
# generate correlation plot figure for EDA

results/correlation_plot.png: src/create_pairplot.R data/clean_data.csv
	Rscript -e 'source("src/create_pairplot.R"); create_pairplot("data/clean_data.csv","results","Pairplot of Bike Share Data Attributes")'	

# generate rmse results from training data and stores to CSV in data

data/rmse_results.csv: src/find_k_min.R data/training_data.csv
	Rscript -e 'source("src/find_k_min.R"); find_k_min("data/training_data.csv", "/home/rstudio/data/rmse_results.csv")'
	
# generate elbow plot figure using the RMSE results 

results/elbow_plot.png: src/create_elbow_plot.R data/rmse_results.csv
	Rscript -e 'source("src/create_elbow_plot.R"); create_elbow_plot("data/rmse_results.csv", "results")'
	
# generate HTML
doc/bike_share_analysis.html: doc/bike_share_analysis.Rmd src/find_k_min.R
	Rscript -e "rmarkdown::render('doc/bike_share_analysis.Rmd', 'html_document')"

#clean	
clean:
	rm -rf results/correlation_plot.png
	rm -rf results/elbow_plot.png
	rm -rf doc/bike_share_analysis.html
	rm -rf data/clean_data.csv
	rm -rf data/training_data.csv
	rm -rf data/testing_data.csv
	rm -rf data/rmse_results.csv
	
