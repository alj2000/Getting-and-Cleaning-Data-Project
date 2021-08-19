# Getting-and-Cleaning-Data-Project
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps done in the R Script
1. Merges the training and the test sets to create one data set: 
   Reading the training and test tables 
   Reading the feature vector
   Reading the activity labels
   Assigning column names and combining all the data to one set
2. Extracts only the measurements on the mean and standard deviation for each measurement:
   Reading column names
   Creating a vector for ID, mean and standard deviation
   Sub-setting from mergeAllInOne
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
   A secondary tidy set names secndryTidySet.txt is made
