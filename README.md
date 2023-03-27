# DSCI-310-Group-6

# Predict Bike Sharing Demand
Authors: Linda Huang, Davis Li, Jialu Jin


## About
The data we are using to compile this report and build our model is a "Bike Sharing Data set" from UCI Machine Learning Repository. The original data were pulled from http://capitalbikeshare.com/system-data.

In this Data Analysis Report, we attempt to build a regression model using KNN algorithm. We will use windspeed (Wind Speed), atemp (Temperature), season (Season) attributes from the data set to predict the demand of bike during different hours, days of the week, and months. The resulting model will be able to help bike sharing business to better understand the demand of bike. Our current model has a prediction error, as measured by root mean squared error (RMSE), of about 1483. While we can improve the model given that the count of total rental bikes in our data set range from 22 to 8714, and the median count of total rental bikes is 4548, the model is still useful.

## Report

The analysis report can be found [here](analysis.ipynb).

## Usage - How to interactively run and explore the project in Jupyter Lab

First, clone this GitHub repository and open the terminal. In the terminal, navigate to the root folder of this project. 

  ```
  git clone https://github.com/JialuJin/dsci-310-group-6

  ```

We use a Docker container image to make the computational environment for this project reproducible.

To interactively run R Studio inside the `jialujin/dsci-310-group-6` Docker container, type the following in terminal, after navigating to the root of this project repository:

  ```
  docker run -it --rm -p 8787:8787 -e PASSWORD=asdf -v "/$(pwd)":/home/rstudio/ jialujin/dsci-310-group-6

  ```
- Once the container has launched, users need to copy the URL to a web browser on your computer and type: `http://localhost:8787` into their web browser to access R Studio. A login panel will appear on the webpage and you can enter username as "rstudio", with password "asdf"
- After this the rstudio will open. Open terminal and type following commands:

```
make clean
  
make all
```
  
- Next, navigate to the doc folder using the directory to find the bike_share_analysis.html.
- when done working, type `docker rm ` to remove the dangling container.

## Dependencies:

R version 4.1.1 with R packages:
    r-GGally=2.1.2 \
    r-tidyverse=1.3.1 \
    r-tidymodels=0.2.0 \
    r-testthat=3.1.3 \
    r-repr=1.1.4 \
    r-readxl=1.4.0 \
    r-digest=0.6.29 \
    r-kknn=1.3.1 \
    r-here=1.0.1

## License Information

The project is made available under the [Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). The software provided in this project is offered under the [MIT open source license](https://opensource.org/license/mit/). 

See [the license file](LICENSE.md) for more information.


