
## createlabels takes the data from features.txt, extracts the variables that
## match the criteria for inclusion in the output data set, and converts it into 
## usable column labels for the data frame, maintaining the numeric position in the
## list so that the variables can be extracted from the full data set.

createlabels <- function(basedir) {
  featuresfile <- paste(basedir, "features.txt", sep="")
  
  ## Read features
  features <- read.table(featuresfile, header = FALSE, sep=" ",  row.names = NULL, col.names = c("number", "featurelabel"))
  removeangles <- grep("^angle", features$featurelabel)
  features <- features[-removeangles,]
  extractmeanandstd <- grep("mean\\(\\)|std\\(\\)",features$featurelabel)
  features <- features[extractmeanandstd,]
  features[,2] <- sapply(features[,2], function(x) sub("\\(\\)","", x))
  features[,2] <- sapply(features[,2], function(x) gsub("\\-","", x))
  features
}

## getactivitylabels reads in the activity labels associated with each of the 
## activities performed by the test subjects. 

getactivitylabels <- function(basedir) {
  activityfile <- paste(basedir, "activity_labels.txt", sep="")
  activitylabels <- read.table(activityfile)
}

## readdata takes a string that is either set to "test" or "train" and reads in
## the data from that set, returning a df with only the data that matches the column numbers in features

readdata <- function(type, basedir, features) {
  datafile <- paste(basedir, type, "/", "X_", type, ".txt", sep="")
  testdata <- read.table(datafile)
  testdata <- testdata[,features[,1]]
  colnames(testdata) <- features[,2]
  testdata
}

## getsubjectandactivities reads in the subject and activity data from the "y_" data 
## files and merges them into one data set with appropriate column headers.
## The function takes an input variable type which specifies whether to read the
## test or train data set and the basedir. 

getsubjectsandactivities <- function(type, basedir) {
  subjectfile <- paste(basedir, type, "/subject_", type, ".txt", sep="")
  activityfile <- paste(basedir, type, "/y_", type, ".txt", sep="")
  subjects <- read.table(subjectfile)
  activities <- read.table(activityfile)
  subjects <- cbind(subjects, activities)
  colnames(subjects) <- c("subject", "activity")
  subjects
}

## run_analysis is the primary function, the work horse
## it does:
## Open the features.txt file, read it, and convert the labels to usable column labels
## Read in the train and test sets and merge into one data frame using the lables created
## Extracts the measurements on the mean and standard deviation from the sets
## Creates a second tidy dataset with the mean of each variable for each subject/activity
## pair

run_analysis <- function() {
  
  ## Set base directory and read in the variable labels.
  basedir <- "data/UCI Har Dataset/"
  featuresfile <- paste(basedir, "features.txt", sep="")
  featurelabels <- createlabels(basedir)

  ## read in the activity labels
   activitylabels <- getactivitylabels(basedir)
  ## Read in the test data set
  testdata <- readdata("test", basedir, featurelabels)

  ## read in the train data set
  traindata <- readdata("train", basedir, featurelabels)

  ## Read in the subjects and activities for each data set
  testsubjects <- getsubjectsandactivities("test", basedir)
  trainsubjects <- getsubjectsandactivities("train", basedir)
  
  ## attach the data to the subjects and activities
  testdata <- cbind(testsubjects, testdata)
  traindata <- cbind(trainsubjects, traindata)
  
  ## bind the test and train data sets into one data set and convert the
  ## activity codes to readible activity labels.
  testdata <- rbind(testdata, traindata)
  testdata[,2] <- sapply(testdata[,2], function(x) x = activitylabels[x,2])
  
  ## Create a second data set from testdata that contains the mean for each 
  ## variable for each subject/activity combination
  melttestdata <- melt(testdata, id = c("subject", "activity"))
  tidytestdata <- dcast(melttestdata, subject + activity ~ variable, fun.aggregate = mean) 
  tidytestdata
}