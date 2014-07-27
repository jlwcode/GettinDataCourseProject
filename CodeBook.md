	Code Book for Summary Dataset created by run_analysis
  
The dataset output by run_analysis() contains the mean for each variable extracted from the Human Activity Recongnition Using Smartphones Data Set by run_analysis summarized by the mean for each variable for each subject/acvtivity pairing. See the README.md for run_analysis for further details on the variables extracted and the features_info.txt from the input data set for more information on the calculations performed to obtain these variables. The value of each variable is normalized to a value between -1 and 1.

subject		2
	Unique integer identifier for the volunteer the data is associated with
		1-30 

activity	Text string
	Describes the specific activity performed when this data was collected.
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

tBodyAccmeanX 	Number
	Mean X component of body signal from acceleration

tBodyAccmeanY
	Mean Y component of body signal from acceleration

tBodyAccmeanZ
	Mean Z component of body signal from acceleration

tBodyAccstdX
	Standard Deviation in X component of body signal from acceleration time domain signal

tBodyAccstdY
	Standard Deviation in Y component of body signal from acceleration time domain signal

tBodyAccstdZ
	Standard Deviation in Y component of body signal from acceleration time domain signal

tGravityAccmeanX
	Mean X component of gravity signal from acceleration time domain signal

tGravityAccmeanY
	Mean Y component of gravity signal from acceleration time domain signal

tGravityAccmeanZ
	Mean Z component of gravity signal from acceleration time domain signal

tGravityAccstdX
	Standard Deviation of X component of gravity signal from acceleration time domain signal

tGravityAccstdY
	Standard Deviation of Y component of gravity signal from acceleration time domain signal

tGravityAccstdZ
	Standard Deviation of Z component of gravity signal from acceleration time domain signal

tBodyAccJerkmeanX
	Mean X Jerk signal from linear acceleration in time.

tBodyAccJerkmeanY
	Mean Y Jerk signal from linear acceleration in time.

tBodyAccJerkmeanZ
	Mean Z Jerk signal from linear acceleration in time.

tBodyAccJerkstdX
	Standard Deviation of X Jerk signal from linear acceleration in time.

tBodyAccJerkstdY
	Standard Deviation of Y Jerk signal from linear acceleration in time.

tBodyAccJerkstdZ
	Standard Deviation of Z Jerk signal from linear acceleration in time.

tBodyGyromeanX
	Mean X component of body signal from gyroscope in time.

tBodyGyromeanY
	Mean Y component of body signal from gyroscope in time.

tBodyGyromeanZ
	Mean Z component of body signal from gyroscope in time.

tBodyGyrostdX
  Standard deviation for X component of body signal from gyroscope in time.

tBodyGyrostdY
  SStandard deviation for Y component of body signal from gyroscope in time.

tBodyGyrostdZ
  Standard deviation for Z component of body signal from gyroscope in time.

tBodyGyroJerkmeanX
  Mean X Jerk signal from angular velocity in time.

tBodyGyroJerkmeanY
  Mean Y Jerk signal from angular velocity in time.

tBodyGyroJerkmeanZ
  Mean Z Jerk signal from angular velocity in time.

tBodyGyroJerkstdX
  Standard deviation in X Jerk signal from angular velocity in time.

tBodyGyroJerkstdY
  Standard deviation in Y Jerk signal from angular velocity in time.

tBodyGyroJerkstdZ
  Standard deviation in Z Jerk signal from angular velocity in time.

tBodyAccMagmean
  Mean Magnitude of the three-dimensional body acceleration.

tBodyAccMagstd
  Standard deviation of the three-dimensional body acceleration.

tGravityAccMagmean
  Mean magnitude of the three-dimensional gravity acceleration.

tGravityAccMagstd
  Standard deviation of the magnitude for the three-dimensional gravity acceleration.

tBodyAccJerkMagmean
  Mean magnitude of the three-dimensional Jerk signal from linear acceleration.

tBodyAccJerkMagstd
  Standard deviation for the magnitude of the three-dimensional Jerk signal from linear acceleration.

tBodyGyroMagmean
  Mean magnitude for the three-dimensional signal from the angular velocity.

tBodyGyroMagstd
  Magnitude of the standard deviation for the three-dimensional signal from the angular velocity.

tBodyGyroJerkMagmean
  Mean magnitude of the three-dimensional Jerk from the angular velocity.

tBodyGyroJerkMagstd

fBodyAccmeanX
	Mean frequency domain X component of body signal from acceleration

fBodyAccmeanY
	Mean frequency domain Y component of body signal from acceleration

fBodyAccmeanZ
	Mean frequency domain Z component of body signal from acceleration

fBodyAccstdX
	Standard deviation of frequency domain X component of body signal from acceleration

fBodyAccstdY
	Standard deviation of frequency domain Y component of body signal from acceleration

fBodyAccstdZ
	Standard deviation of frequency domain Z component of body signal from acceleration

fBodyAccJerkmeanX
	Mean frequency domain X Jerk 

fBodyAccJerkmeanY
	Mean frequency domain Y Jerk

fBodyAccJerkmeanZ
	Mean frequency domain Z Jerk

fBodyAccJerkstdX
	Standard deviation of frequency domain X Jerk

fBodyAccJerkstdY
	Standard deviation of frequency domain Y Jerk

fBodyAccJerkstdZ
	Standard deviation of frequency domain Z Jerk

fBodyGyromeanX
  Mean frequency domain angular velocity in X.

fBodyGyromeanY
  Mean frequency domain angular velocity in Y.

fBodyGyromeanZ
  Mean frequency domain angular velocity in Z.

fBodyGyrostdX
  Standard deviation frequency domain angular velocity in X.
  
fBodyGyrostdY
  Standard deviation frequency domain angular velocity in Y.
  
fBodyGyrostdZ
  Standard deviation frequency domain angular velocity in Z.
  
fBodyAccMagmean
  Mean magnitude of frequncy domain signal of three-dimentional accelerarion.
  
fBodyAccMagstd
  Standard deviation of frequncy domain signal of three-dimentional accelerarion.
  
fBodyBodyAccJerkMagmean
  Mean magnitude of three-dimensional Jerk acceleration.
  
fBodyBodyAccJerkMagstd
  Standard deviation of three-dimensional Jerk acceleration.

fBodyBodyGyroMagmean
  Mean magnitude of frequncy domain three-dimenstional angular velocity.
  
fBodyBodyGyroMagstd
  Standard deviation of frequncy domain three-dimenstional angular velocity.

fBodyBodyGyroJerkMagmean
  Mean magnitude frequency domain of the three-dimensional jerk from angular velocity.

fBodyBodyGyroJerkMagstd
  Standard deviation of magnitude of frequency domain three-dimensional jerk from angular velocity.

NOTE: These variable names are derived from the data included in the Human Activity Recognition Using Smartphones Data Set obtained from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

NOTE: The names have been modified to allow for processing by R, removing characters that would interfere with that processing. 

NOTE: See README.md that is included with the run_analysis.R script for complete details on the processing done to obtain this data set.