==============================================================================

Data Science Specialization

==============================================================================

Getting and Cleaning Data Course Project
==============================================================================

README Document - run_analysis.R



Input Data: sourced via one of the following) -  

* Uncompressed text file folder: Smartlab “UCI HAR Dataset”

* Compressed download file: "getdata-projectfiles-UCI HAR Dataset"

* Download link: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Output Data - "tidydataset.txt



The run_analysis.R script loads the run_analysis() function which executes the following processing steps. No execution parameters are involved.


* Stage input data: Look for uncompressed file folder in working directory first, then compressed download file. Download if neither is found.  

* Load required R packages: data.table, dplyr, tidyr

* Read the relevant Smartlab text file data into R  

* Restructure the train/test measurement data input and add feature variable names

* Convert the restructured measurement data to numeric and then merge with their positionally matching subject and activity ids for each observation. Combine the independently merged train and test data rows into a single table.

* Extract the mean and standard deviation features/measurements into another table 

* Add descriptive activity names to the extracted data
* Reorder the table columns and drop the temporary ones

* Remove the feature id from the measurement variable names (no longer required for uniqueness)

* Create an independent tidy data set with the average of each variable for each activity and each subject. Write out the result as a "tidydataset.txt" file to the working directory.
