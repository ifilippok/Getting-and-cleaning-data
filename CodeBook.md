##CodeBook

#Transformation details
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#The data

# Section 1.

* x_test - variables from test set
* y_test - indexes of test labels 
* subject_test - indexes to identify subject who performed activity
* x_train - variables from train set
* y_train - indexes of training labels 
* subject_train - indexes to identify subject who performed activity
* data - merged data

# Section 2.

* features - vector of all features
* extracted_features - boolean vector of features with mean and std values
* data - merged data with mean and standard deviation for each measurement

# Section 3.

* activity_labels - links the class labels with their activity name

# Section 4.

* id_vars - id variables for melting operation (reshape2 lib)
* measure_vars - measusere variables for melting operation (reshape2 lib)
* col_names - appropriate labels for data set

# Section 5.

melt_data - intermediate (melted data) data set for evaluating tidy data set
tidy_data - tidy data set with the average of each variable for each activity and each subject 
