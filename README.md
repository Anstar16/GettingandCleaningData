# Getting and Cleaning Data Course Project

This repository contains code for the Course Project on Coursera's
"Getting and Cleaning Data" course. It reads in accelerometer and gyroscope
data taken from a Samsung Galaxy S II and produces a cleaned summary of the
data.

### Script
Creat an R script run_analysis.R, that does the following:

1. Download the dataset in the working directory
2. Load the activity and feature information
3. Load both the training and test datasets and extract only
   a mean or standard deviation measurement
4. Load the activity and subject data for each dataset and merge those
   columns with the dataset
5. Merge the two datasets to create one data set
6. Convert the activity and subject columns into factors
7. Create a tidy dataset that consists of the average value of each
   variable for each subject and activity pair.
   
 
The end result is shown in the file ``tidy.txt``.


###Steps to Use the Script
1. Clone this repository to your machine.
2. Set your R session's working directory to the cloned directory 
3. Execute the ``run_analysis.R`` script: source('run_analysis.R')
4. When complete, a file named ``tidy.txt`` will be created in the working
   directory.
   
###Script Dependencies
The R script assumes you have 'data.table' installed using install.packages("read.table")
install.packages("plyr")


Details about the output data can be found in the accompanying code book.

