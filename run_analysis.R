
## createlabels takes the data from features.txt and converts it into 
## usable column labels for the data frame

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

getactivitylabels <- function(basedir) {
  activityfile <- paste(basedir, "activity_labels.txt", sep="")
  activitylabels <- read.table(activityfile)
}

## readdata takes a string that is either set to "test" or "training" and reads in
## the data from that set, returning a df with only the data that matches the column numbers in features

readdata <- function(type, basedir, features) {
  datafile <- paste(basedir, type, "/", "X_", type, ".txt", sep="")
  testdata <- read.table(datafile)
  testdata <- testdata[,features[,1]]
  colnames(testdata) <- features[,2]
  testdata
}

##

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
## Read in the training and test sets and merge into one data frame using the lables created
## Extracts the measurements on the mean and standard deviation from the sets
## Creates a second tidy dataset with the average of each variable for each activity and each

run_analysis <- function() {
  basedir <- "data/UCI Har Dataset/"
  featuresfile <- paste(basedir, "features.txt", sep="")
  
  featurelabels <- createlabels(basedir)

   activitylabels <- getactivitylabels(basedir)

  testdata <- readdata("test", basedir, featurelabels)

  traindata <- readdata("train", basedir, featurelabels)

  testsubjects <- getsubjectsandactivities("test", basedir)
  trainsubjects <- getsubjectsandactivities("train", basedir)
  testdata <- cbind(testsubjects, testdata)
  traindata <- cbind(trainsubjects, traindata)
  testdata <- rbind(testdata, traindata)
  testdata[,2] <- sapply(testdata[,2], function(x) x = activitylabels[x,2])
  melttestdata <- melt(testdata, id = c("subject", "activity"))
  tidytestdata <- dcast(melttestdata, subject + activity ~ variable, fun.aggregate = mean) 
  tidytestdata
}