UCI-HAR-DataPrep
================

### Background
One of the most exciting areas in all of data science right now is wearable computing - <a href= "http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/"> see example here</a> . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This project will utilize data from the Samsung Galaxy S smartphone collected by the <a href= "http://cml.ics.uci.edu/">University of California (UCI) Center for Machine Learning and Intelligent Systems</a>.  

### Purpose and Scope
The purpose of this project is to to collect, work with, and clean a data set. The data set that will be used for this project can be found on the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "> UCI Machine Learning Repository</a> and is named *Human Activity Recognition Using Smartphones Data Set* version 1.0.   

The goal is to prepare tidy data that can be used for later analysis. This project is done solely in the R programming language. This was done for the final project of the *Getting and Cleaning Data* course from the Johns Hopkins Bloomberg School of Public Health offered through Coursera.  
  
### Other Documents
The other documents in this repository are:   
**./README.md** - This file, which provides some context to the project.  
**./CodeBook.md** - A code book that should be referred to when reusing, reproducing or extending any of this work.   
**./run_analysis.R** - The R routine that extract, cleans and produces UCI-HAR-TidyDataSet.  
**./gitignore** - list of files and folders to ignore when pushing to this repository. 
  
### Outputs
**./data** - Folder on your working directory that contains the untouched zipped and unzipped data from UCI.  
**./UCI-HAR-TidyDataSet.csv** - The final product in .csv format.  
**./UCI-HAR-TidyDataSet.txt** - The final product in .txt format.  
**./Rhistory** - Log file detailing the list of actions performed to produce UCI-HAR-TidyDataSet. 

### General Statistics

##### CPU Time Measures: 
 - user: 30.89s  
 - system: 4.83s  
 - elapsed 86.58s  

##### File/Folder Sizes: 
 - **./data** folder: 329MB
 - UCI-HAR-TidyDataSet.*: 220KB  
 - Overall folder (after <code>run\_analysis.R</code> execution): 399MB  

### Refrences
1. <a href= "http://cml.ics.uci.edu/">University of California (UCI) Center for Machine Learning and Intelligent Systems</a>  
2. <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "> UCI Machine Learning Repository</a> 
3. <a href="https://class.coursera.org/getdata-002"> Coursera: Getting and Cleaning Data</a>
4. <a href="http://www.biostat.jhsph.edu/~jleek/"> Professor Jeffrey Leek</a>
