# Code Book

## Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

### The set of variables that were estimated from these signals and included in the final dataset are: 
* mean(): Mean value
* std(): Standard deviation

## Transformations
1.	Pre-merge formatting for each dataset (TRAIN and TEST)
	a.	Combine the columns from the x, y, and subjects, as well as a new column indicating the set to preserve the distiction between sets
	b.	Melt the dataset with ids: subject, activity, and set
2.	Merge the two formatted sets TRAIN and TEST
3.	Aggregate the data using dcast to take the mean of multiple measurments made for each variable for each activity and each subject and set

## Columns
* subject - The unique ID of the volunteer who performed the activity  

* activity - One of the following six activities:  
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING  

* set - Either of the two sets of data:  
1. TRAIN
2. TEST

##### For more info on the following columns, see the Feature Selection section:
* tbodyacc_mean_x
* tbodyacc_mean_y
* tbodyacc_mean_z
* tbodyacc_std_x
* tbodyacc_std_y
* tbodyacc_std_z
* tgravityacc_mean_x
* tgravityacc_mean_y
* tgravityacc_mean_z
* tgravityacc_std_x
* tgravityacc_std_y
* tgravityacc_std_z
* tbodyaccjerk_mean_x
* tbodyaccjerk_mean_y
* tbodyaccjerk_mean_z
* tbodyaccjerk_std_x
* tbodyaccjerk_std_y
* tbodyaccjerk_std_z
* tbodygyro_mean_x
* tbodygyro_mean_y
* tbodygyro_mean_z
* tbodygyro_std_x
* tbodygyro_std_y
* tbodygyro_std_z
* tbodygyrojerk_mean_x
* tbodygyrojerk_mean_y
* tbodygyrojerk_mean_z
* tbodygyrojerk_std_x
* tbodygyrojerk_std_y
* tbodygyrojerk_std_z
* tbodyaccmag_mean
* tbodyaccmag_std
* tgravityaccmag_mean
* tgravityaccmag_std
* tbodyaccjerkmag_mean
* tbodyaccjerkmag_std
* tbodygyromag_mean
* tbodygyromag_std
* tbodygyrojerkmag_mean
* tbodygyrojerkmag_std
* fbodyacc_mean_x
* fbodyacc_mean_y
* fbodyacc_mean_z
* fbodyacc_std_x
* fbodyacc_std_y
* fbodyacc_std_z
* fbodyaccjerk_mean_x
* fbodyaccjerk_mean_y
* fbodyaccjerk_mean_z
* fbodyaccjerk_std_x
* fbodyaccjerk_std_y
* fbodyaccjerk_std_z
* fbodygyro_mean_x
* fbodygyro_mean_y
* fbodygyro_mean_z
* fbodygyro_std_x
* fbodygyro_std_y
* fbodygyro_std_z
* fbodyaccmag_mean
* fbodyaccmag_std
* fbodybodyaccjerkmag_mean
* fbodybodyaccjerkmag_std
* fbodybodygyromag_mean
* fbodybodygyromag_std
* fbodybodygyrojerkmag_mean
* fbodybodygyrojerkmag_std

## Assumptions
1.	The preservation of the distinction between datasets (TRAIN and TEST) in order to compare the differences between the two
2.	Since there are only two types of signal measurments (time domain and frequency domain) the prefixes 't' and 'f' are determined to be tidy in their abbreviated form, rather than creating overly verbose variable names.
