title: "README.md"
author: "P. Gago"
date: "2022-11-18"


## this is part of the Final project for "Getting_and_cleanning_data" course of Cursera 
## run_analysis.R
This script manipulates on the data downloaded from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and needs to be executed from the directory containing the folder  (UCI_HAR_Dataset). 


As required it: 

1-Merges the training and the test sets to create one data set.

2-Extracts only the measurements on the mean and standard deviation for each measurement. 

3-Uses descriptive activity names to name the activities in the data set

4-Appropriately labels the data set with descriptive variable names. 

5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To print the final data set into a file named "Averages_by_activity_and_subject.txt" the last line of the code needs to be un-commented.

#Requirements 
dplyr



