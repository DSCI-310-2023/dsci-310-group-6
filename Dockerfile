FROM rocker/tidyverse:4.1.3

RUN R -e "install.packages(c('ggplot2', 'dplyr','readxl','digest','repr','tidymodels','GGally'))"

# Set working directory
WORKDIR /

# Copy project files to container
COPY . /

# Launch Jupyter Lab
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]


