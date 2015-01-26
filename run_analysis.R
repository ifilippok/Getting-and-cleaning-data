#This scrip perform following:
#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)

myFunc <- function()
{
#-------------- 1 Merging training and test sets ----------------  
  #Reading test sets
  x_test = read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test = read.table("./UCI HAR Dataset/test/Y_test.txt", col.names="activity")
  subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject")
  
  #Reading train sets
  x_train = read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train = read.table("./UCI HAR Dataset/train/Y_train.txt", col.names="activity")
  subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject")
  
  #Merging sets
  data <- rbind(cbind(subject_test, y_test, x_test),
                cbind(subject_train, y_train, x_train))
  
  
#-------------- 2 Extracting features ---------------------------  
  #Reading features name 
  features = read.table("./UCI HAR Dataset/features.txt")
  features = features[,2]

  #Exctracting features with mean and std values
  extracted_features = grepl("mean|std", features)
  data = data[,c(TRUE,TRUE,extracted_features)]

#-------------- 3 Name activity in the data set -----------------

  #Reading activity names
  activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")

  data$activity = activity_labels[data$activity,2]

#-------------- 4 Create appropriate names -----------------
  id_vars = c("subject", "activity")
  measure_vars = as.character(features[extracted_features])
  col_names = c(id_vars, measure_vars)
  colnames(data) = col_names

#-------------- 5 Creating tidy data set -----------------
  # 
  melt_data = melt(data, id = id_vars, measure.vars = measure_vars)

  # Creating mean for each variable
  tidy_data = dcast(melt_data, subject + activity ~ variable, mean)

  write.table(tidy_data, file = "./tidy_data.txt")
}