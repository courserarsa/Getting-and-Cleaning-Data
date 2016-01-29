==============================================================================
Data Science Specialization
Getting and Cleaning Data Course Project CodeBook
Version 1.0
==============================================================================
coursera.rsa@gmail.com
Project CodeBook: Summary explanation of the project relevant input and output data

Input Data: Smartlab “UCI HAR Dataset” used in this project consists of a collection of text (.txt) files that are contextually described within the datasets included “README” and “features_info” documents.  The information provided below was derived either directly or indirectly from those materials, including direct quotes.  

Smartlab Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
http://archive.ics.uci.edu/ml/datasets/
Human+Activity+Recognition+Using+Smartphones”
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

==============================================================================
Data transformation and output, as defined by the project assignment:
  Create one R script called run_analysis.R that does the following. 
     1.Merges the training and the test sets to create one data set.
     2.Extracts only the measurements on the mean and standard deviation for each measurement. 
     3.Uses descriptive activity names to name the activities in the data set
     4.Appropriately labels the data set with descriptive variable names. 
     5.From the data set in step 4, creates a second, independent tidy data set with the average of each 
     variable for each activity and each subject.
==============================================================================

Output: Tidydataset.txt (per project requirement #5)
180 observations (30 subjects x 6 activities) of 88 variables (activity, subject and the 86 average mean/standard deviation measures for each)
Column 1 –  “activity” [character]
*  Definition:  Description of the activities performed by a subject when the raw movement   measurements were captured. 
* Values:  See item “E” under Inputs section above
Column 2 - "subjectid" [integer]
* Definition: Identifier for the subjects performing the activities measured. 
* Values:  See item “C” under Inputs section above
Column 3:88 – [numeric]
* Definition: Average of each mean and standard deviation ‘feature’ for each activity and each subject, as a subset of item “C” under Inputs section above
* Values:  See selected names listing below

Tidydataset Column Names Listing
[1] "activity"                             "subjectid"                           
 [3] "tBodyAcc-mean()-X"                    "tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                    "tBodyAcc-std()-X"                    
 [7] "tBodyAcc-std()-Y"                     "tBodyAcc-std()-Z"                    
 [9] "tGravityAcc-mean()-X"                 "tGravityAcc-mean()-Y"                
[11] "tGravityAcc-mean()-Z"                 "tGravityAcc-std()-X"                 
[13] "tGravityAcc-std()-Y"                  "tGravityAcc-std()-Z"                 
[15] "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"               
[17] "tBodyAccJerk-mean()-Z"                "tBodyAccJerk-std()-X"                
[19] "tBodyAccJerk-std()-Y"                 "tBodyAccJerk-std()-Z"                
[21] "tBodyGyro-mean()-X"                   "tBodyGyro-mean()-Y"                  
[23] "tBodyGyro-mean()-Z"                   "tBodyGyro-std()-X"                   
[25] "tBodyGyro-std()-Y"                    "tBodyGyro-std()-Z"                   
[27] "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"              
[29] "tBodyGyroJerk-mean()-Z"               "tBodyGyroJerk-std()-X"               
[31] "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"               
[33] "tBodyAccMag-mean()"                   "tBodyAccMag-std()"                   
[35] "tGravityAccMag-mean()"                "tGravityAccMag-std()"                
[37] "tBodyAccJerkMag-mean()"               "tBodyAccJerkMag-std()"               
[39] "tBodyGyroMag-mean()"                  "tBodyGyroMag-std()"                  
[41] "tBodyGyroJerkMag-mean()"              "tBodyGyroJerkMag-std()"              
[43] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                   
[45] "fBodyAcc-mean()-Z"                    "fBodyAcc-std()-X"                    
[47] "fBodyAcc-std()-Y"                     "fBodyAcc-std()-Z"                    
[49] "fBodyAcc-meanFreq()-X"                "fBodyAcc-meanFreq()-Y"               
[51] "fBodyAcc-meanFreq()-Z"                "fBodyAccJerk-mean()-X"               
[53] "fBodyAccJerk-mean()-Y"                "fBodyAccJerk-mean()-Z"               
[55] "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                
[57] "fBodyAccJerk-std()-Z"                 "fBodyAccJerk-meanFreq()-X"           
[59] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"           
[61] "fBodyGyro-mean()-X"                   "fBodyGyro-mean()-Y"                  
[63] "fBodyGyro-mean()-Z"                   "fBodyGyro-std()-X"                   
[65] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                   
[67] "fBodyGyro-meanFreq()-X"               "fBodyGyro-meanFreq()-Y"              
[69] "fBodyGyro-meanFreq()-Z"               "fBodyAccMag-mean()"                  
[71] "fBodyAccMag-std()"                    "fBodyAccMag-meanFreq()"              
[73] "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-std()"           
[75] "fBodyBodyAccJerkMag-meanFreq()"       "fBodyBodyGyroMag-mean()"             
[77] "fBodyBodyGyroMag-std()"               "fBodyBodyGyroMag-meanFreq()"         
[79] "fBodyBodyGyroJerkMag-mean()"          "fBodyBodyGyroJerkMag-std()"          
[81] "fBodyBodyGyroJerkMag-meanFreq()"      "angle(tBodyAccMean,gravity)"         
[83] "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                
[87] "angle(Y,gravityMean)"                 "angle(Z,gravityMean)"

