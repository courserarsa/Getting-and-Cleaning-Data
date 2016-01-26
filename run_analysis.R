##  Data Science Specialization
##  Getting and Cleaning Data Course Project
##
run_analysis <- function() {

##  Download and stage project files    
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles
%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/getdata-projectfiles-UCI HAR Dataset",
    method="auto",quiet=TRUE)
unzip("./data/getdata-projectfiles-UCI HAR Dataset",exdir="./data")
filepath <- "./data/UCI HAR Dataset/"
    
##  Load required libraries
    library(data.table)
    library(dplyr)
    library(tidyr)

##  1.  Merge the training and the test sets to create one data set
##  1.a Input raw data    
    activity <- read.table(paste0(filepath,"activity_labels.txt"), 
                header=FALSE, sep="\t", quote = "\"", dec = ".", 
                fill=TRUE, comment.char = "", col.names=c("activity"),
                colClasses="character")
    feature <- read.table(paste0(filepath, "features.txt"), 
                header=FALSE, sep="\t", quote = "\"", dec = ".", 
                fill=TRUE, comment.char = "", col.names=c("feature"),
                colClasses="character")
    traindata <- read.table(paste0(filepath, "train/x_train.txt"), 
                header=FALSE, sep="\r", dec = ".", col.names=c("measure"),
                colClasses="character", strip.white=TRUE)
    testdata <- read.table(paste0(filepath, "test/x_test.txt"), 
                header=FALSE, sep="\r", dec = ".", col.names=c("measure"),
                colClasses="character", strip.white=TRUE)
    trainlabel <- read.table(paste0(filepath, "train/y_train.txt"), 
                header=FALSE, sep="\t", col.names=c("labelid"))
    testlabel <- read.table(paste0(filepath, "test/y_test.txt"), 
                header=FALSE, sep="\t", col.names=c("labelid"))
    trainsubject <- read.table(paste0(filepath, "train/subject_train.txt"), 
                header=FALSE, sep="\t", col.names=c("subjectid"))
    testsubject <- read.table(paste0(filepath, "test/subject_test.txt"), 
                header=FALSE, sep="\t", col.names=c("subjectid"))

##  1.b Restructure raw measurement data and add feature variable names
    traindata <- traindata %>% separate(measure, feature$feature, 
                            sep = "  | ", remove=TRUE)
    testdata <- testdata %>% separate(measure, feature$feature, 
                            sep = "  | ", remove=TRUE)

##  1.c Merge numeric feature/measurement variables with matching subject 
##  and activity identifiers and then combine test/train rows
    for (i in 1:561) {
        traindata[,i] <- as.numeric(as.character(traindata[,i]))}
    for (i in 1:561) {
        testdata[,i] <- as.numeric(as.character(testdata[,i]))}
    mergedtrain <- bind_cols(trainsubject, trainlabel, traindata)
    mergedtest <- bind_cols(testsubject, testlabel, testdata)
    mergeddata <- bind_rows("train"=mergedtrain,"test"=mergedtest,
                             .id="datagroup")
    
##  2.Extract only the measurements on the mean and standard deviation for 
##  each measurement
    mergeddata <- select(mergeddata, datagroup, subjectid, labelid,
                            matches("mean|std"))

##  3.Use descriptive activity names to name the activities in the data set
    activity <- activity %>% separate(activity, c("activityid", "activity"), 
                                      sep = " ", remove=TRUE)
    activity <- transform(activity, activityid = as.integer(activityid))
    setnames(mergeddata, "labelid", "activityid")
    mergeddata <- mergeddata %>% left_join(activity, by="activityid") %>% 
            mutate(activity)
    
##  4.Appropriately label the data set with descriptive variable names
##  4.a Drop temporary columns
    mergeddata <- mergeddata[,c(1,2,3,90,4:89)]
    mergeddata <- select(mergeddata, -datagroup, -activityid)

#   4.b Drop feature id from measurement variable names
    x <- as.data.frame(names(mergeddata[,3:88]))
    colnames(x) <- "name"
    y <- separate(x, name, into=c("featureid", "feature"), sep = " ")
    names(mergeddata)[3:88] <- y$feature
    
##  5.From the data set in step 4, create a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.
    tidydataset <- mergeddata %>% group_by(activity, subjectid) %>% 
        summarize_each(funs(mean), matches("mean|std"))
    
    write.table(tidydataset, file="tidydataset.txt",row.name=FALSE)
}


