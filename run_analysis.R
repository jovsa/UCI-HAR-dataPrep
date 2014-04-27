# File Name: run_analysis.R
# Written By: Jovan Sardinha
# Created On: April 26, 2014
# Email: jovan.sardinha@gmail.com
# Operating System: Windows 7 (32 bit)
# R Version: R version 3.1.0 (2014-04-10)  
# Github Repo: https://github.com/JovanSardinha/UCI-HAR-DataPrep  

# Packages Installed
install.packages("plyr")

# Libraries
library(plyr)


# Data extraction from UCI HAR and load in ./data
if(!file.exists("./data")){dir.create("./data")}
OrigDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- paste("./data/", basename(OrigDataURL),sep = "")
download.file(OrigDataURL, file)
unzip(file, exdir = "./data")

# Setting up the path variables for data extraction
dataDir <- "./data/UCI HAR Dataset"
testDataDir <- paste(dataDir, "/test", sep = "")
trainDataDir <- paste(dataDir, "/train", sep = "")

# Loading general data in the R workspace
features <- read.table(paste(dataDir, "/features.txt", sep = ""))
activityLabels <- read.table(paste(dataDir, "/activity_labels.txt", sep = ""))

# Loading the Testing Data
XTest <- read.table(paste(testDataDir, "/X_test.txt", sep = ""))
yTest <- read.table(paste(testDataDir, "/y_test.txt", sep = ""))
subjectTest <- read.table(paste(testDataDir, "/subject_test.txt", sep = ""))

# Loading the Training Data
XTrain <- read.table(paste(trainDataDir, "/X_train.txt", sep = ""))
yTrain <- read.table(paste(trainDataDir, "/y_train.txt", sep = ""))
subjectTrain <- read.table(paste(trainDataDir, "/subject_train.txt", sep = ""))

# Adding labels to the orginal testing data
features <- arrange(features,V1)
colnames(XTest)<- features$V2

# Adding labels to the original training data
features <- arrange(features,V1)
colnames(XTrain)<- features$V2

# Merging testing subject data to the testing data
testData <- cbind(subjectTest,XTest)
colnames(testData)[1] <- "test_subject"

# Merging testing subject data to the training data
trainData <- cbind(subjectTrain,XTrain)
colnames(trainData)[1] <- "test_subject"

## Joining activity data with testing test subjects 
testActivity <- join(yTest, activityLabels, by="V1")

# Joining activity data with training test subjects 
trainActivity <- join(yTrain, activityLabels, by="V1")

# Joining activity data with with the overall test data set
testData <- cbind(testActivity, testData)
colnames(testData)[1] <- "activity_number"
colnames(testData)[2] <- "activity_label"

# Joining activity data with with the overall training data set
trainData <- cbind(trainActivity, trainData)
colnames(trainData)[1] <- "activity_number"
colnames(trainData)[2] <- "activity_label"

# Merging the testing and the training data sets
MergedData <- rbind(testData, trainData)


# Extracting only columns with mean and std. dev for each column
meanRegEx <- grep(("*.-mean[()].*"),colnames(MergedData))
stdRegEx <- grep(("*.-std[()].*"),colnames(MergedData))
MergedDataIndicators<- MergedData[, c(2:3,meanRegEx,stdRegEx)]

# Creating the Tidy Data set
# Taking the average of each column grouped by each activity and by each subject.
tidyDataSet <- aggregate(MergedDataIndicators[,3:68], by =list(MergedDataIndicators[,1], MergedDataIndicators[,2]), FUN = mean, na.rm = TRUE)
colnames(tidyDataSet)[1] <- "activity_label"
colnames(tidyDataSet)[2] <- "test_subject"

# Writing the tidy data set in .csv
write.table(tidyDataSet, file ="./UCI-HAR-TidyDataSet.csv",row.names=FALSE,sep=",")

# Writing the tidy data set in .txt
write.table(tidyDataSet, file ="./UCI-HAR-TidyDataSet.txt",row.names=FALSE,sep=",")

# EOF
