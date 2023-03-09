FROM rocker/tidyverse:4.1.3

RUN R -e "install.packages(c('readxl','digest','repr','tidymodels','GGally'))"

# Set working directory
WORKDIR /

# Copy project files to container
COPY . /
