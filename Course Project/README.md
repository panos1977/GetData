# Getting and Cleaning Data Course Project

## Introduction
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. More specifically, this repo contains the raw dataset in zip format called HCI HAR Dataset.zip, the R script called run_analysis.R , the code book called CodeBook.md and the tidy data set called tidy_dataset.txt.

## About the raw dataset
The raw data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For description of the raw dataset you can see the CodeBook.md file.

## About the R script
Here, we describe how run_analysis.R script works.

1. First, download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip the file getdata_projectfiles_UCI HAR Dataset.zip and it must be availble in a directory called "UCI HAR Dataset".
3. Make sure the directory "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.
4. Open the R script run_analysis.R using RStudio.
5. Use source("run_analysis.R") command in RStudio. 
6. After executing of the R script one output file is generated in the current working directory called tidy_dataset.txt.
7. Finally, use data <- read.table("tidy_dataset.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 

## About the Code Book
The CodeBook.md file explains the transformations performed and the resulting data and variables.

## About the tidy data set
The R script will create a tidy data set which containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a text file called tidy_dataset.txt, which can also be found in this repository.
