FROM rocker/tidyverse:4.1.3

RUN R -e "install.packages(c('readxl','digest','repr','tidymodels','GGally'))"
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"

# Set working directory
#WORKDIR /

# Copy project files to container
#COPY . /
