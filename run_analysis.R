
#Download and unzip the dataset

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#You should create one R script called run_analysis.R that does the following
#******************************************************************
# 1.Merges the training and the test sets to create one data set.
#******************************************************************

# Reading trainings and test tables

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assigning column names and combining all data to one set

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
mergeAllInOne <- rbind(merge_train, merge_test)


#***********************************************************************************************
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#***********************************************************************************************

# Reading column names

colNames <- colnames(mergeAllInOne)

# Creating a vector for ID, mean and standard deviation

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# Sub-setting from mergeAllInOne

MeanAndStd <- mergeAllInOne[ , mean_and_std == TRUE]

#******************************************************************************
#3. Uses descriptive activity names to name the activities in the data set
#******************************************************************************

setWithActivityNames <- merge(MeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#*****************************************************************************
#4. Appropriately labels the data set with descriptive variable names.
#*****************************************************************************

#******************************************************************************************************************************************************
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#******************************************************************************************************************************************************
secndryTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secndryTidySet <- secndryTidySet[order(secndryTidySet$subjectId, secndryTidySet$activityId),]
write.table(secndryTidySet, "secndryTidySet.txt", row.name=FALSE)