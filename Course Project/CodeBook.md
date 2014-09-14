# Getting and Cleaning Data Course Project

This file describes the variables, the data, and any transformations or work that you performed to clean up the data.

* The data set for the project is here:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The run_analysis.R script performs the following steps/transformations to clean the dataset:
  1. Read the subject_train.txt, X_train.txt and Y_train.txt files from the "train" directory and store them in train_sub,      train_x and train_y data frames variables respectively.
  2. Read the subject_test.txt, X_test.txt and Y_test.txt files from the "test" directory and store them in test_sub,           test_x and test_y data frames variables respectively.
  3. Merge the train_sub and the test_sub data frames to form a new data frame called dt_sub. Similarly, we merge the        train_x and test_x data frames to form a new data frame called dt_x. Finally, we merge the train_y and test_y data      frames to form a new data frame called dt_y.
  4. Read the features.txt file from the "UCI HAR Dataset" directory and store the data in a data frame variable called features. We only extract the measurements on the mean and standard deviation for each measurement. This results in a 66 indices list. We get a subset of dt_x with the 66 corresponding columns.
  5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
