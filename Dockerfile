FROM rocker/tidyverse:4.1.3

RUN R -e "install.packages(c('readxl','digest','repr','tidymodels','GGally'))"

# Set working directory
WORKDIR /

# Copy project files to container
COPY . /

<<<<<<< HEAD
=======
# Launch Jupyter Lab
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]

>>>>>>> cb5e20e9c59dc6c980389cc96c709eed5800c052

