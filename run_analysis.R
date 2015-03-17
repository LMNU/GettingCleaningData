# Set working directory to the directory containing the UCI HAR Dataset
#setwd("~/Documents/Coursera/GettingCleaningData/UCI HAR Dataset")

# Clean workspace
remove(list=ls())

# Load additional packages
library(dplyr)

# Read text-files containing labels for each activity and each feature
activity_labels<-read.table("activity_labels.txt")
feature_labels<-read.table("features.txt")

# Clean up the feature labels so they can be used as variable names
feature_labels$V2<-sub("\\(\\)\\-",".",feature_labels$V2)
feature_labels$V2<-sub("\\(\\)","",feature_labels$V2)
feature_labels$V2<-sub(",","",feature_labels$V2)
feature_labels$V2<-sub("-",".",feature_labels$V2)

# Read text-files containing data
subject_train<-read.table("train/subject_train.txt",col.names="subject_id")
y_train<-read.table("train/y_train.txt",col.names="activity_id")
X_train<-read.table("train/X_train.txt")
subject_test<-read.table("test/subject_test.txt",col.names="subject_id")
y_test<-read.table("test/y_test.txt",col.names="activity_id")
X_test<-read.table("test/X_test.txt")

# Apply feature labels as variable names to the columns of X_train
names(X_train)<-feature_labels$V2
names(X_test)<-feature_labels$V2

# Find which feature labels contain the strings "mean()" or "std()"
col_id<-grep("mean\\(\\)|std\\(\\)",feature_labels$V2)

# Create data frame containing subject_id activity_id and features containing mean and std
train_data<-data.frame(subject_train,y_train,X_train[,col_id])
test_data<-data.frame(subject_test,y_test,X_test[,col_id])

# Merge train and test data
data<-rbind(train_data,test_data)

# Apply activity labels to activity_id
data$activity_id<-factor(data$activity_id,levels=c(1:6),labels=activity_labels$V2)

# Group data by activity and subject
data <- group_by(data,subject_id, activity_id)

# Create new data set containing average of each variable for each activity and subject
data2 <- summarise_each(data,"mean")

# Save table2
write.table(data2,file="data2.txt",row.name=FALSE)