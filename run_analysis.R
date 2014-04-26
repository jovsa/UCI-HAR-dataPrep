##########################
# Done By: Jovan Sardinha
# Created: April 26, 2014
##########################


if(!file.exists("./data")){dir.create("./data")}

if(length(list.files("./data"))==0){
    file.create("./data/here2.csv")
    invisible()
}

temp <- tempfile()
OrigDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile<-download.file(OrigDataURL,temp)
unzip(OrigDataURL)

read.zip <- function(zipfile = OrigDataURL, row.names=NULL, dec=".") {
     # Create a name for the dir where we'll unzip
     zipdir <- tempfile()
     # Create the dir using that name
     zipdir = "./zip"
     dir.create(zipdir)
     # Unzip the file into the dir
     unzip(zipfile, exdir=zipdir)
     # Get the files into the dir
     files <- list.files(zipdir)
     # Throw an error if there's more than one
     if(length(files)>1) stop("More than one data file inside zip")
     # Get the full name of the file
     file <- paste(zipdir, files[1], sep="/")
     # Read the file
}

