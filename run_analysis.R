############################################
# Author: Medina Colic
# Course: Gettting and Cleaning Data
# Assignment: Course Project
############################################

library(reshape2)
# Downloading and unzipping the dataset
project_data <- "datasets.zip"
if (!file.exists(project_data)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, project_data, method="curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(project_data)
}


# Loading the activity and features data
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extracting only the data on mean and standard deviation
featuresRequired <- grep(".*mean.*|.*std.*", features[,2])
featuresRequired.names <- features[featuresRequired,2]
featuresRequired.names = gsub('-mean', 'Mean', featuresRequired.names)
featuresRequired.names = gsub('-std', 'Std', featuresRequired.names)
featuresRequired.names <- gsub('[-()]', '', featuresRequired.names)


# Loading the rest of datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresRequired]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresRequired]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


# Merging the train and test data into one set
trainData <- cbind(x_train, y_train, subject_train)
testData <- cbind(x_test, y_test, subject_test)
combinedData <- rbind(trainData, testData)

# Labeling the data
colnames(combinedData) <- c("subject", "activity", featuresRequired.names)

# Storing activities and subjects into vectors for easier creation of tidy data
combinedData$activity <- factor(combinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combinedData$subject <- as.factor(combinedData$subject)

combinedData_melted <- melt(combinedData, id = c("subject", "activity"))
combinedData_mean <- dcast(combinedData_melted, subject + activity ~ variable, mean)

write.table(combinedData_mean, "tidy_data.txt", row.names = FALSE, quote = FALSE, sep = " ")
