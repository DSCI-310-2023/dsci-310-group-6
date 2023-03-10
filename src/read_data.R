# Author: Jialu Jin
# Date: 2023-03-10

"This script reads a CSV file from a specified directory, sets the header to true, and unselects specified columns.

# Usage: read_data.R --file_path=<file_path> --cols=<cols>

# Options:
# --file_path=<file_path>   Path to the data file
# --cols=<cols>             Comma-separated list of columns to exclude from the data frame
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

data <- read.csv(opt$file_path, header = TRUE)

exclude_cols <- strsplit(opt$cols, ",")[[1]]

data <- data %>%
  select(-one_of(exclude_cols))

print(head(data))