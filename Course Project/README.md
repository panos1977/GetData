# Getting and Cleaning Data Course Project

## Introduction
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. More specifically, this repo contains the R script called run_analysis.R and the code book called codebook.md.

## About the R script
Here, we describe how run_analysis.R script works.

1. First, download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip the file UCI HAR Dataset.zip and it must be availble in a directory called "UCI HAR Dataset".
3. Make sure the directory "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.
4. Open the R script run_analysis.R using RStudio.
5. Use source("run_analysis.R") command in RStudio. 
6. After executing of the R script one output file is generated in the current working directory called tidy_dataset.txt.
7. Finally, use data <- read.table("tidy_dataset.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 

## About the Code Book
The codebook.md file explains the transformations performed and the resulting data and variables.

