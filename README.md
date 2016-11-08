# Getting-and-Cleaning-Data-Course-Project
The final project for Getting and Cleaning Data Course which is a 3rd course in Data Science Specialization provided by Johns Hopkins University.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The project has a simple goal to prepare tidy data that can be used for later analysis. Within this repository I will explain how all of the scripts work and how they are connected.

The data for the project is provided from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script, run_analysis.R, does the following:

- Downloads the dataset from the above provided link
- Loads the training and test datasets
- Merges the two datasets
- Labels the data with descriptive names
- Converts the activity and subject columns into factors
- Creates a tidy dataset that consists of the average value of each variable for each subject and activity pair.
