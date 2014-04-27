# File Name: run_analysis.R
# Written By: Jovan Sardinha
# Created On: April 26, 2014
# Email: jovan.sardinha@gmail.com
# Operating System: Windows 7 (32 bit)

#Packages Installed
install.packages("plyr")

#Libraries
library(plyr)


#Data extraction
if(!file.exists("./data")){dir.create("./data")}
OrigDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- paste("./data/", basename(OrigDataURL),sep = "")
download.file(OrigDataURL, file)
unzip(file, exdir = "./data")

#Loading the data in R workspace
dataDir <- "./data/UCI HAR Dataset"
testDataDir <- paste(dataDir, "/test", sep = "")
trainDataDir <- paste(dataDir, "/train", sep = "")

##General Data
features <- read.table(paste(dataDir, "/features.txt", sep = ""))
activityLabels <- read.table(paste(dataDir, "/activity_labels.txt", sep = ""))
##Testing Data
XTest <- read.table(paste(testDataDir, "/X_test.txt", sep = ""))
yTest <- read.table(paste(testDataDir, "/y_test.txt", sep = ""))
subjectTest <- read.table(paste(testDataDir, "/subject_test.txt", sep = ""))
##Training Data
XTrain <- read.table(paste(trainDataDir, "/X_train.txt", sep = ""))
yTrain <- read.table(paste(trainDataDir, "/y_train.txt", sep = ""))
subjectTrain <- read.table(paste(trainDataDir, "/subject_train.txt", sep = ""))

#Labeling Data
##Testind Data
features <- arrange(features,V1)
colnames(XTest)<- features$V2

##Training Data
features <- arrange(features,V1)
colnames(XTrain)<- features$V2

#Merging Data with testing subject
##Testing Data 
testData <- cbind(subjectTest,XTest)
colnames(testData)[1] <- "test_subject"

##Training Data with subject
trainData <- cbind(subjectTrain,XTrain)
colnames(trainData)[1] <- "test_subject"

## Step 3
#Joining activity data
##Test Data
testActivity <- join(yTest, activityLabels, by="V1")

##Train Data
trainActivity <- join(yTrain, activityLabels, by="V1")

#Joining activity data with with the overall data set
##Testing Data
testData <- cbind(testActivity, testData)
colnames(testData)[1] <- "activity_number"
colnames(testData)[2] <- "activity_label"

##Training Data
trainData <- cbind(trainActivity, trainData)
colnames(trainData)[1] <- "activity_number"
colnames(trainData)[2] <- "activity_label"

# Step 1
#Merging Testing and Training Data
MergedData <- rbind(testData, trainData)


#Step 2
#Getting only columns with mean and std. dev for each column
meanRegEx <- grep(("*.-mean[()].*"),colnames(MergedData))
stdRegEx <- grep(("*.-std[()].*"),colnames(MergedData))
MergedDataIndicators<- MergedData[, c(2:3,meanRegEx,stdRegEx)]

#Step 5
#Creating the tidy data set

#for debudding
#write.table(MergedDataIndicators, file ="./filename.csv",row.names=FALSE,sep=",")


tidyDataSet <- aggregate(MergedDataIndicators[,3:68], by =list(MergedDataIndicators[,1], MergedDataIndicators[,2]), FUN = mean, na.rm = TRUE)
colnames(tidyDataSet)[1] <- "activity_label"
colnames(tidyDataSet)[2] <- "test_subject"

#for writing out the tidy data set
write.table(tidyDataSet, file ="./UCI-HAR-TidyDataSet.csv",row.names=FALSE,sep=",")


