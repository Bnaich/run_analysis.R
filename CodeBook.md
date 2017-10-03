Code Book

***** 1. Merges the training and the test sets to create one data set. ***** 

Read all features (from the accelerometer and gyroscope) from txt files 
to data-frames (X_train, y_train,  X_test, y_test, subject_test, subject_train, 
features and activity_labels)

from datasets X_train and X_test (use rbind()), y_train and y_test (use rbind()),
subject_test and subject_train(use rbind()) with cbind() function get big dataset (data)

rename first two columns ("subject_id" and "activity_id")

*****  2. Extracts only the measurements on the mean and standard deviation for each measurement. ***** 

dataset_short is a dataset contains only the features that contain "mean()" or "std()"

***** 3. Uses descriptive activity names to name the activities in the data set ***** 

with a simple function function(x,y) {y[x,2]} in role of sapply() arg
rename activity values (from numbers to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS etc)

*****  4. Appropriately labels the data set with descriptive variable names. ***** 

Get descriptive name by using colnames() and grepl functions for data_short and features datasets
[1] "activity_id"
[2] "subject_id"
[3] "tBodyAcc_Mean_X"
[4] "tBodyAcc_Mean_Y"
etc...

*****  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. ***** 

Get tidy data with summarising (summarise_each()) of grouped and arranged data_shorts set(groped_by(), arrange())
