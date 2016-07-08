#Created by Albert Blanchart July 2016 for the Coursera "Getting and cleaning the data" assignment

#Downloading and unzipping the dataset

	if(!file.exists("./data")){dir.create("./data")}
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl,destfile="./data/Dataset.zip")

	unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Reading all the files into R

	x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
	y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
	subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

	x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
	y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
	subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

	features <- read.table('./data/UCI HAR Dataset/features.txt')

	activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#Definig the column names in each variable

	colnames(x_train) <- features[,2] 
	colnames(y_train) <-"activityId"
	colnames(subject_train) <- "subjectId"
      
	colnames(x_test) <- features[,2] 
	colnames(y_test) <- "activityId"
	colnames(subject_test) <- "subjectId"
      
	colnames(activityLabels) <- c('activityId','activityType')

#Merging the data

	all_train <- cbind(y_train, subject_train, x_train)
	all_test <- cbind(y_test, subject_test, x_test)
	AllInOne <- rbind(all_train, all_test)

#Defining column names and extracting only mean and std for each measurement

	colNames <- colnames(AllInOne)
	
	#creating the vector defining ID, mean and standard desviation
	id_mean_std <- (grepl("activityId" , colNames) | 
           grepl("subjectId" , colNames) | 
           grepl("mean.." , colNames) | 
           grepl("std.." , colNames) 
                )
	#subsettin AllInOne
	filteredAllInOne <- AllInOne[ , id_mean_std == TRUE]

#Labelling the data set with the appropiate labels

	tidyDataSet <- merge(filteredAllInOne, activityLabels, by = "activityId", all.x= TRUE)


	
	

