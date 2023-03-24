FROM rocker/tidyverse:4.1.3

RUN Rscript -e "install.packages(c('readxl','digest','repr','tidymodels','GGally'))"
RUN apt-get update && apt-get install -y libglpk-dev
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN Rscript -e "install.packages('testthat')"
