FROM rocker/tidyverse:4.1.3

RUN Rscript -e "install.packages(c('readxl','digest','repr','tidymodels','GGally','kknn'))"
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
