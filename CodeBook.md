==============================================================================
Data Science Specialization
==============================================================================
Getting and Cleaning Data Course Project
==============================================================================
Project CodeBook - 
Summary explanation of the project relevant input and output data

Input Data Source: Smartlab “UCI HAR Dataset” 
==============================================================================
The Smartlab data used for this project consists of a collection of text (.txt) files that are contextually described within the dataset's “README” and “features_info” documents.  The information provided below was derived either directly or indirectly from those materials, including many direct quotes.  

Smartlab's "Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones”

Input Data Analysis
==============================================================================
A. “- 'train/X_train.txt': Training set” and “- 'test/X_test.txt': Test set”
* Numeric, processed signal data values. Includes both positive and negative decimal values.
* Unique subject/activity measurement observations, each consisting of  a 561 discrete ‘feature’ measure vector structured as individual rows within these text documents.  Each observations is delimited via a carriage return, with its discrete measures delimited via space characters.
* Each of the recorded feature measures was derived through processing the raw signal data contained in the “Inertial Signals” files, which are also included within the Smartlab data set.  Those raw data files are not included within the scope of this project.

B. “- 'features.txt': List of all features”
* Names for each of the 561 measurement variables recorded within the data files described in “A”
* The feature/measurement names are aligned positionally by measure sequence within each subject/activity observation
* Feature names include an integer sequence id/value that is required to ensure uniqueness within the complete feature set. It appears that this is due to the “bandsEnergy” related names not otherwise distinguishing amongst the “3-axial signal” dimensions for those measures.

C. “- 'train/subject_train.txt'” and “- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. “
* Integer subject id values, ranging from 1 to 30, aligned positionally (by row sequence)  with the respective train and test data sets described in “A”. 
* Train data subject ids:  1, 3, 5:8, 11, 14:16, 19, 21:23, 25:30 (21 total)
* Test data subject ids:  2, 4, 9:10, 12:13, 18, 20, 24 (9 total)

D. “- 'train/y_train.txt': Training labels “ and “- 'test/y_test.txt': Test labels” 
* Integer activity id values, ranging from 1 to 6, identifying the activity associated with each observation in the train and test data sets described in “A”.
* This activity id data is aligned positionally (by row sequence)  with the respective train and test data sets.

E. “- 'activity_labels.txt': Links the class labels with their activity name.”
* Integer activity ids with corresponding descriptions:  1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING
* These six activity ids align with the labels files described in “D”. 

Data requirements for the project
==============================================================================
  Create one R script called run_analysis.R that does the following. 
     1.Merges the training and the test sets to create one data set.
     2.Extracts only the measurements on the mean and standard deviation for each measurement. 
     3.Uses descriptive activity names to name the activities in the data set
     4.Appropriately labels the data set with descriptive variable names. 
     5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Output File: Tidydataset.txt 
==============================================================================
180 observations (30 subjects x 6 activities) of 88 variables (activity, subject and the 86 average mean/standard deviation measures for each)

[1] –  “activity” [character]
* Definition:  Description of the activities performed by a subject when the raw movement   measurements were captured. 
* Values:  See item “E” under Inputs section above

[2] - "subjectid" [integer]
* Definition: Identifier for the subjects performing the activities measured. 
* Values:  See item “C” under Inputs section above

[3:88] – Column Names listed below [numeric]
* Definition: Average of each mean and standard deviation ‘feature’ for each activity and each subject, as a subset of item “C” under Inputs section above
* Values:  Calculated numeric mean per activity/subject

Column Names [3:88] - 
[3]	"tBodyAcc-mean()-X"			[4]	"tBodyAcc-mean()-Y"
[5]	"tBodyAcc-mean()-Z"			[6]	"tBodyAcc-std()-X"
[7]	"tBodyAcc-std()-Y"			[8]	"tBodyAcc-std()-Z"
[9]	"tGravityAcc-mean()-X"			[10]	"tGravityAcc-mean()-Y"
[11]	"tGravityAcc-mean()-Z"			[12]	"tGravityAcc-std()-X"
[13]	"tGravityAcc-std()-Y"			[14]	"tGravityAcc-std()-Z"
[15]	"tBodyAccJerk-mean()-X"			[16]	"tBodyAccJerk-mean()-Y"
[17]	"tBodyAccJerk-mean()-Z"			[18]	"tBodyAccJerk-std()-X"
[19]	"tBodyAccJerk-std()-Y"			[20]	"tBodyAccJerk-std()-Z"
[21]	"tBodyGyro-mean()-X"			[22]	"tBodyGyro-mean()-Y"
[23]	"tBodyGyro-mean()-Z"			[24]	"tBodyGyro-std()-X"
[25]	"tBodyGyro-std()-Y"			[26]	"tBodyGyro-std()-Z"
[27]	"tBodyGyroJerk-mean()-X"		[28]	"tBodyGyroJerk-mean()-Y"
[29]	"tBodyGyroJerk-mean()-Z"		[30]	"tBodyGyroJerk-std()-X"
[31]	"tBodyGyroJerk-std()-Y"			[32]	"tBodyGyroJerk-std()-Z"
[33]	"tBodyAccMag-mean()"			[34]	"tBodyAccMag-std()"
[35]	"tGravityAccMag-mean()"			[36]	"tGravityAccMag-std()"
[37]	"tBodyAccJerkMag-mean()"		[38]	"tBodyAccJerkMag-std()"
[39]	"tBodyGyroMag-mean()"			[40]	"tBodyGyroMag-std()"
[41]	"tBodyGyroJerkMag-mean()"		[42]	"tBodyGyroJerkMag-std()"
[43]	"fBodyAcc-mean()-X"			[44]	"fBodyAcc-mean()-Y"
[45]	"fBodyAcc-mean()-Z"			[46]	"fBodyAcc-std()-X"
[47]	"fBodyAcc-std()-Y"			[48]	"fBodyAcc-std()-Z"
[49]	"fBodyAcc-meanFreq()-X"			[50]	"fBodyAcc-meanFreq()-Y"
[51]	"fBodyAcc-meanFreq()-Z"			[52]	"fBodyAccJerk-mean()-X"
[53]	"fBodyAccJerk-mean()-Y"			[54]	"fBodyAccJerk-mean()-Z"
[55]	"fBodyAccJerk-std()-X"			[56]	"fBodyAccJerk-std()-Y"
[57]	"fBodyAccJerk-std()-Z"			[58]	"fBodyAccJerk-meanFreq()-X"
[59]	"fBodyAccJerk-meanFreq()-Y"		[60]	"fBodyAccJerk-meanFreq()-Z"
[61]	"fBodyGyro-mean()-X"			[62]	"fBodyGyro-mean()-Y"
[63]	"fBodyGyro-mean()-Z"			[64]	"fBodyGyro-std()-X"
[65]	"fBodyGyro-std()-Y"			[66]	"fBodyGyro-std()-Z"
[67]	"fBodyGyro-meanFreq()-X"		[68]	"fBodyGyro-meanFreq()-Y"
[69]	"fBodyGyro-meanFreq()-Z"		[70]	"fBodyAccMag-mean()"
[71]	"fBodyAccMag-std()"			[72]	"fBodyAccMag-meanFreq()"
[73]	"fBodyBodyAccJerkMag-mean()"		[74]	"fBodyBodyAccJerkMag-std()"
[75]	"fBodyBodyAccJerkMag-meanFreq()"	[76]	"fBodyBodyGyroMag-mean()"
[77]	"fBodyBodyGyroMag-std()"		[78]	"fBodyBodyGyroMag-meanFreq()"
[79]	"fBodyBodyGyroJerkMag-mean()"		[80]	"fBodyBodyGyroJerkMag-std()"
[81]	"fBodyBodyGyroJerkMag-meanFreq()"	[82]	"angle(tBodyAccMean,gravity)"
[83]	"angle(tBodyAccJerkMean),gravityMean)"	[84]	"angle(tBodyGyroMean,gravityMean)"
[85]	"angle(tBodyGyroJerkMean,gravityMean)"	[86]	"angle(X,gravityMean)"
[87]	"angle(Y,gravityMean)"			[88]	"angle(Z,gravityMean)"


