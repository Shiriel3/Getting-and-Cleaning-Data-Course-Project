#Getting and Cleaning Data Course Project

##Overview
This program compiles the data gathered by the University of California, Irvine in an experiment involving 30 volunteers who performed 6 activities wearing a Samsung Galaxy S II smartphone on the waist. The pre-compiled data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##The Script
The program consists of one R script, run_analysis.R, that contains a function 'run_analysis' that calculates the mean of each variable for each activity and each subject contained in the UCI dataset, and returns a tidy dataset.

##The process
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Required R packages
*	reshape2


___
For additional information on the final dataset, see CodeBook.md
