Data Science Specialization

==============================================================================


Getting and Cleaning Data Course Project
==============================================================================

"run_analysis.R

" script for run_analysis() function

Input Data: (sourced via one of the following) -  

* Uncompressed text file folder: Smartlab “UCI HAR Dataset”

* Compressed download file: "getdata-projectfiles-UCI HAR Dataset"

* Download link: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Output Data - "tidydataset.txt



The run_analysis.R script loads the run_analysis() function to execute the following processing steps. No execution parameters are specified.


* Stage input data: Look for uncompressed file folder in working directory or the compressed download file. Download the latter if neither is found.  

* Load required R packages: "data.table", "dplyr", "tidyr
"
* Read the relevant Smartlab text file data into R  

* Restructure the train/test measurement data input and add feature variable names

* Convert the restructured measurement data to numeric and then merge with the positionally matching subject and activity ids for each observation. Combine the separately merged train and test data rows into a single table.

* Extract the mean and standard deviation features/measurements 

* Add descriptive activity names to the extracted data

* Drop the unnecessary columns and reorder the remaining
* Remove the feature id from the measurement variable names (no longer required for uniqueness)

* Create an independent tidy data set with the average of each variable for each activity and each subject. Write out the result as a "tidydataset.txt" file to the working directory.
