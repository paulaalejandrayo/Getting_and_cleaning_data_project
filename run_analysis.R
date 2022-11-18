#You should create one R script called run_analysis.R that does the following. 
#1-Merges the training and the test sets to create one data set.

library("dplyr")

names_activities<-read.csv("UCI\ HAR\ Dataset/activity_labels.txt",header = FALSE,sep = " ", )
#dim(names_activities) #6 2 this data.frame contains the code for the activities

names_features<-read.csv("UCI\ HAR\ Dataset/features.txt",header = FALSE,sep = "", col.names = c("number","feature" ))
#dim(names_features[2]) #561 this data.frame contains the code for the features

case_tests  <-c("subject_test.txt",  "X_test.txt",    "y_test.txt" )
case_train  <-c("subject_train.txt",  "X_train.txt",    "y_train.txt" )

name_test<-paste("./UCI\ HAR\ Dataset/test/",case_tests,sep="")
test_subject  <-read.csv(name_test[1],header = FALSE,sep = "",col.names="subjects")
test_features <-read.csv(name_test[2],header = FALSE,sep = "", col.names=names_features$feature)
test_activity <-read.csv(name_test[3],header = FALSE,sep = "", col.names="activity_code")
test_data<- cbind(test_subject, test_activity, test_features)

name_train<-paste("./UCI\ HAR\ Dataset/train/",case_train,sep="")
train_subject  <-read.csv(name_train[1],header = FALSE,sep = "",col.names="subjects")
train_features <-read.csv(name_train[2],header = FALSE,sep = "", col.names=names_features$feature)
train_activity <-read.csv(name_train[3],header = FALSE,sep = "", col.names="activity_code")
train_data<- cbind(train_subject, train_activity, train_features)
  
Merged_data<-rbind(test_data,train_data)
dim(Merged_data)

#2-Extracts only the measurements on the mean and standard deviation for each measurement. 

Mean_and_std_selection<- Merged_data %>% select("subjects", "activity_code", c(contains("mean",ignore.case = FALSE), contains("std", ignore.case = FALSE)))

#3-Uses descriptive activity names to name the activities in the data set

Mean_and_std_selection$activity_code<-names_activities[Mean_and_std_selection$activity_code,2] #this replaces the activity_code by its corresponding activity
names(Mean_and_std_selection)[2]<-"activity"  #the column name is consequentely adjusted

#4-Appropriately labels the data set with descriptive variable names. 

names2<- sub("mean", "Mean-value_", names(Mean_and_std_selection))
names2<- sub("Acc", "Aceleration_",names2)  
names2<- sub("std", "Standard-deviation_",names2) 
names2<- sub("^t", "time-domain_",names2)  
names2<- sub("f", "Frequency-domain_",names2)  
names2<- sub("Gravity", "Gravity_",names2) 
names2<- sub("Body", "Body_",names2) 
names2<- sub("Gyro", "Gyroscopic_",names2) 
names2<- sub("Mag", "Magnitude_",names2) 
#names2<- gsub(".", "",names2) ### In my R version, the brackets from the data_set names are replaced by . (dots) when I load it as col.names (lines 17 and 23), I cannot find the way of replacing these dots 

names(Mean_and_std_selection)<-names2 #Replace the column names by human readable names 
#head(names2)

#5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

grouped_data<-group_by(Mean_and_std_selection,subjects,activity)
Averages_by_activity_and_subject <-summarise_all(grouped_data,list(mean))

#Averages_by_activity_and_subject <-Mean_and_std_selection %>% group_by(subjects,activity) %>% summarise_all(list(mean)) #short form
Averages_by_activity_and_subject
########################################
#this last line is to print the data into a file. This is the data to be submitted for the assignment
#write.table(Averages_by_activity_and_subject,file="Averages_by_activity_and_subject.txt",row.name=FALSE)




