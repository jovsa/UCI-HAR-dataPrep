UCI-HAR-DataPrep
================
  
  
### Background
One of the most exciting areas in all of data science right now is wearable computing - <a href= "http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/"> see example here</a> . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This project will utilize data from the Samsung Galaxy S smartphone collected by the <a href= "http://cml.ics.uci.edu/">University of California (UCI) Center for Machine Learning and Intelligent Systems</a>. 

### Purpose and Scope
The purpose of this project is to to collect, work with, and clean a data set. The data set that will be used for this project can be found <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "> on the UCI Machine Learning Repository</a> and is named 'Human Activity Recognition Using Smartphones Data Set' v1.0.   

The goal is to prepare tidy data that can be used for later analysis. This project is done solely in the R programming language. This was done for the final project of the Getting and Cleaning Data course from the Johns Hopkins Bloomberg School of Public Health offered through Coursera.  

### OtherDocuments in the repository 
**./README.md** - This file, which provides some context to the project.  
**./CodeBook.md** - A code book that should be referred to when reusing, reproducing or extending any of this work.   
**./run_analysis.R** - The R routine that extract, cleans and produces UCI-HAR-TidyDataSet.csv.
**./gitignore** - list of files and folders to ignore when pushing to this repository. 

### Outputs
**./data** - Folder on your working directory that contains the untouched zipped and unzipped data from UCI.
**./UCI-HAR-TidyDataSet.csv** - The final product in .csv format.
**./Rhistory** - Log file detailing the list of actions performed to produce UCI-HAR-TidyDataSet.csv.