---
title: "codebook"
author: "P. Gago"
date: "2022-11-18"

---

1-Information about the variables

The variables in Averages_by_activity_and_subject.txt are  the average for each activity and each subject of the features containing mean values and standard deviation ( Merged_data %>% select("subjects", "activity_code", c(contains("mean",ignore.case = FALSE), contains("std", ignore.case = FALSE)))).

Merged_data set contains the information of the test and train datasets merged: subject_test.txt, X_test.txt, Y_test.txt, subject_train.txt, X_train.txt, Y_tain.txt, combined for this propose. (X=features,y=activity label).


2-Process from original data:

run_analysis.R


3-Original data and sources


This dataset processes the data in "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and selects the "features" containing mean values and standard deviation of the observables reported there.


Required data structure:

UCI\ HAR\ Dataset/activity_labels.txt #provides the labels of the activities in the research
UCI\ HAR\ Dataset/feature.txt         #provides the names of the features in the research

UCI\ HAR\ Dataset/test/subject_test.txt   
UCI\ HAR\ Dataset/test/X_test.txt   
UCI\ HAR\ Dataset/test/y_test.txt

UCI\ HAR\ Dataset/train/subject_train.txt   
UCI\ HAR\ Dataset/train/X_train.txt   
UCI\ HAR\ Dataset/train/y_train.txt

Extra files:
UCI\ HAR\ Dataset/README.txt          #Details the experiment and the original data structure  
UCI\ HAR\ Dataset/features_info.txt   #details the meaning of the features and the way they were obtained 