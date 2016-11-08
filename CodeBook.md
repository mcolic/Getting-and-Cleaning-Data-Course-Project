### Code Book for Getting and Collecting Data Course Project

This code book describes the variables, the data, and any transformations or work that I have performed to clean up the raw data obtained from the link below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

There were multiple steps to process the data after checking if the neccessary datasets were downloaded.

Steps that were taken prior to process the data:

1. Loaded the activities and features from the data sets
2. Extracted only the required data about mean and standard deviation
3. Loaded the rest of data sets (x_train, y_train, subject_train, x_test, y_test, submject_test)
4. Merged the train and test data to create one data set
5. Stored activities and features from combinedData into vector for easier creation of tidy data
6. A new tidy data set was created with the mean values of the features



#### Variables used within the process
* read.table("features.txt"): Imported "features.txt" file into a table - features
* featuresRequired: extracted the rows that contain the word "mean" or "std"
* read.table("activity_labels.txt"): Imported "activity.txt"  file into a table - activityLabels

#### Train Variables
* read.table("X_train.txt"): Imported "X_train.txt" file into a table - x_train
* read.table("y_train.txt"): Imported "y_train.txt" file into a table - y_train 
* read.table("subject_train.txt"): Imported "subject_train.txt" file into a table - subject_train
* trainData: Contains all the train data (merged with x_train, y_train, and subject_train tables)

#### Test Variables
* read.table("X_test.txt"): Imported "X_test.txt" file into a table - x_test
* read.table("y_test.txt"): Imported "y_test.txt" file into a table - y_test 
* read.table("subject_test.txt"): Imported "subject_test.txt" file into a table - subject_trest
* testData: Contains all the train data (merged with x_test, y_test, and subject_test tables)

#### Combined Data
* combinedData: Contains Train and Test data (10299 observations and 82 variables)

#### Tidy Data Variable
* tidy_data: Contains the Train and Test data with the average of each variable. (3,160 observations and 4 variables)


