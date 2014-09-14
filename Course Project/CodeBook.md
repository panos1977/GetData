# Getting and Cleaning Data Course Project

This file describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Data Source
The original dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

More specifically, the data set for the project is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set is split into a training and a test set (70% and 30%, respectively). Each part is also split into three files that contains the measurements from the accelerometer and gyroscope, activity label and an identifier for the subject. In other words, the dataset included the following data files:

  * features.txt: List of all features.
  * activity_labels.txt: List of class labels and their activity name.
  * train/X_train.txt: Training set.
  * train/y_train.txt: Training labels.
  * train/subject_train.txt: ID's of subjects in the training data.
  * test/X_test.txt: Test set.
  * test/y_test.txt: Test labels.
  * test/subject_test.txt: ID's of subjects in the training data

## Tidy Dataset
The final and clean tidy dataset will be a dataframe which will contains the 68 variables:
 1. subject: ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
 2. activity:  Descriptive name of each subject's activity. The factor values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
 3. The selection of the remaining 66 variables is based on the features.txt file where we extracts only the measurements on the mean and standard deviation for each measurement according to the assignment. For this reason, we included all variables having to do with mean or standard deviation.

## A description of the analysis script
The analysis script called run_analysis.R accepts the original dataset and performs the following steps/transformations in order to get the clean tidy dataset. Generally, the analysis script performs the following steps:
 1. Read all required files for the original dataset.
 2. Merging the training and the test data sets.
 3. Extracting data.
 4. Melt the dataset with the approriate names and labels for better handling.
 5. Creating a tidy data set.
 
The run_analysis.R script performs one of the steps described above in more detail:
  1. Read the subject_train.txt, X_train.txt and Y_train.txt files from the "train" directory and store them in train_sub,      train_x and train_y data frames variables respectively.
  2. Read the subject_test.txt, X_test.txt and Y_test.txt files from the "test" directory and store them in test_sub,           test_x and test_y data frames variables respectively.
  3. Merge the train_sub and the test_sub data frames by row to form a new data frame called dt_sub. Similarly, we merge the train_x and test_x data frames by row to form a new data frame called dt_x. Finally, we merge the train_y and test_y data frames by row to form a new data frame called dt_y.
  4. Read the features.txt file from the "UCI HAR Dataset" directory and store the data in a data frame variable called features. We only extract the measurements on the mean and standard deviation for each measurement. This results in a 66 indices list. We get a subset of dt_x with the 66 corresponding columns.
  5. Read the activity_labels.txt file form the "UCI HAR Dataset" directory and store the data in a data frame variable called activity_names.
  6. Get the activity numbers from the first column of activity data set (i.e. dt_y) and replace them with descriptive terms which are words from the second column of the activity_names data frame. We also make all descriptive names to lower cases.
  7. Give the appropriate lables to three data sets, i.e. dt_sub, dt_y and dt_x with descriptive variables names so that to be more understandable. More specifically, we give the name "subject" for the unique column of the dt_sub data set and the name "activity" for the unique collumn of the dt_y data set. The "subject" column contains integers that range from 1 to 30 inclusive and the "activity" column contains 6 kinds of activity names. Furthermore, the column names of the dt_x data set are based on the features data set after the extraction of appropriate measurements. We clean these column names so that to be more descriptive. In other words, we remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
  8. Merge the dt_sub, dt_y and dt_y data sets by column in order to get a new cleaned data frame called dt.
  9. Generate a second independent tidy data set called tidydt with the average of each measurement for each activity and each subject. For each combination subject and activity, we calculate the mean of each measurement. So, after initializing the tidydt data frame and performing the two for-loops, we get a 180x68 data frame.
  10. Finally, give the appropriate column descriptive names in the tidydt data set and write the result out to "tidy_dataset.txt" file in current working directory. 
