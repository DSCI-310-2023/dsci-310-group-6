# author: Davis Li
# date: 2023-03-24

# generate clean data

data/clean_data.csv: src/read_data.R data/day.csv
	Rscript -e 'source("src/read_data.R"); read_data("data/day.csv",c("instant", "dteday", "yr", "holiday", "casual", "registered"))'
	
