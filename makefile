# author: Davis Li
# date: 2023-03-24

# generate clean data

data/clean_data.csv: src/read_data.R data/day.csv
	Rscript src/read_data.R --file_path="data/day.csv" --cols='c("instant", "dteday", "yr", "holiday", "casual", "registered")'