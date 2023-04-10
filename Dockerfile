FROM rocker/tidyverse:4.1.3

RUN apt-get update && apt-get install -y libxt6

RUN Rscript -e "install.packages(c('readxl','digest','repr','tidymodels','GGally', 'here'))"
RUN apt-get update && apt-get install -y libglpk-dev
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN Rscript -e "install.packages('testthat')"
RUN Rscript -e "install_github('DSCI-310/dsci-310-group-6-pkg')"

