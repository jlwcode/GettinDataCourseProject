This Readme describes the use of the run_analysis.r file.

run_analysis.r contains the run_analysis function plus four support functions. The entire file must be sourced for run_analysis to run properly.

The five functions are:

run_analysis()

The script assumes that the UCI HAR dataset has been downloaded to a directory called "data/UCI Har Dataset/" within the working directory and that the directory structure of the data has been maintained.

This function reads the test data from the Human Activity Recognition Using Smart Phones data set, taking in both the test and train sets from their respective X_test.txt files. It creates a data frame containing only the variables which are either a mean or standard deviation computation result. It only takes final results so intermediate values or ancillary mean values such as the mean frequency values are not included. The script assigns labels to each of the variables by taking the labels from the features.txt file. The labels are used as is except that characters which will be interpreted as control characters in R are removed. These characters are "(",")", and "_".

The values in the activity column are converted to readable text using the mapping of id to label provided in the file activity_labels.txt.

Once the test and train data sets have been proceeded the two are combined into one data frame called testdata and the activity labels are converted to readable form. 

The final step is to reshape the data into a table that contains the mean for each variable computed for each subject/activity pair. This is the final output of the script and is assigned to the variable tidydataset.



createlabels(basedir)

This function extracts the labels for the variables from features.txt. It returns the labels with their index so that the result can be used to extract only the desired variables from the loaded data set.

getactivitylabels(basedir)

This function loads in the activity labels.

readdata(type, basedir, features)

This function reads in a data set. Type is either "test" or "train" to select the data set to read. Basedir in the root directory which is set by run_analysis. Features is the result returned by the createlabels function. readdata returns a data from containing on the desired variables from the test set with the column labels in place. 

getsubjectsandactivities(type, basedir)

This function gets the contents of the subject_test.txt which contains the subjects for each set of data and the file y_test.txt which contains the activity for each set of data. It binds there into one data frame and labels the columns subject and activity. The type indicates whether to get the data from the "test" or "train" data set.

