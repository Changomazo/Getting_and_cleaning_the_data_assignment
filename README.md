# Getting_and_cleaning_the_data_assignment
All files (including script, codebook and Readme) necessary to complete the assignment of week 4 in the course getting and cleaning the data

## Assignment files included:
* run_analysis.R
* README.md
* CodeBook.md
* The tidy Data set obtained after applying all calculations explained in point 5 of the assignment.

The run_analysis.R R-script does the following:
* Downloads and unzippes the data set collected from the UCI Machine Learning Repository ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your current working directory
* Reads the downloaded and extracted files into R
* Defines the column names for each variable
* Merges the data (from the variables created before in R)
* Extraction mean and Standard Deviation for each measurement. This step includes 
