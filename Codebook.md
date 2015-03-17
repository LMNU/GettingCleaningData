# Codebook

This is a codebook describing all the variables in the data set "data2.txt" produced by the R script "run_analysis.R" included in this repository for the course project of "Getting and Cleaning Data" on Coursera.com

## Original data
The data are collected from accelerometers from the Samsung Galaxy S smartphone during an experiment with 30 volunteers. A full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

- **variables**: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. There are 561 variables in the original data set. Please see the file "features_info.txt" for more information about the variables.

- **observations**: Each feature was captured for each volunteer during each activity at a constant rate of 50 Hz. This means that each feature was measures 50 times per second. There are 30 volunteers ('subject_id' runs from 1 to 30) and 6 activities (walking, walking_upstairs, walking_downstairs, sitting, standing and laying). For each combination of subject and activity, there are between 36 and 95 measurements, leading to an overal number of observations of 10299.

## Transformed data
The transformed data show the average of each variable/feature for each activity and each subject (so it shows the averages across all the 50 Hz measurements). 

- **variables**:

- **observations**: The transformed data thus contain one row for each volunteer (identified by the variable 'subject_id') and for each activity carried out by that volunteer (identified by the variable 'activity_id). There are 30 volunteers ('subject_id' runs from 1 to 30) and 6 activities (walking, walking_upstairs, walking_downstairs, sitting, standing and laying).

## Transformations