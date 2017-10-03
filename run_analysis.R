
#   0. Read data
X_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")
X_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
features <- read.table(file = "./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#   1. Merge training and test sets to create one data set
subject <- rbind(subject_test, subject_train)
y <- rbind(y_test, y_train)
X <- rbind(X_test, X_train)
data <- cbind(subject,y,X)
   # rename first two columns
names(data)[1] <- "subject_id"
names(data)[2] <- "activity_id"


#    2. Extracts only the measurements on the mean and standard deviation for each measurement.

data_short <- select(data,  subject_id,activity_id,features$V1[grepl("mean()", features$V2) | grepl("std()", features$V2)]+2)


#    3. Uses descriptive activity names to name the activities in the data set

data_short$activity_id <- sapply(data_short$activity_id, function(x,y) {y[x,2]}, activity_labels)
 
#    4. Appropriately labels the data set with descriptive variable names.
colnames(data_short)[3:ncol(data_short)] <- 
  as.character(features$V2[grepl("mean()", features$V2) | grepl("std()", features$V2)])

#    5. From the data set in step 4, creates a second, independent tidy data set with the average
     #  of each variable for each activity and each subject.
data_short <- arrange(data_short,subject_id)
data_short %>% 
  group_by(subject_id, activity_id) %>%
  summarise_each(funs(mean), colnames(data_short)[3:ncol(data_short)])