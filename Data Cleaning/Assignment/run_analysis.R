
# Download and unzip the dataset
if (!file.exists("dataset.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
  download.file(fileUrl,destfile="", mode='wb')
}

# Unzip the dataset
if (!file.exists("UCI HAR Dataset")) { 
  unzip("dataset.zip") 
}

# Load the training dataset, activities and subjects
df_train_measurements <- read.table("UCI HAR Dataset/train/X_train.txt")
df_train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
df_train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load the test dataset, activities and subjects
df_test_measurements <- read.table("UCI HAR Dataset/test/X_test.txt")
df_test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
df_test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1) Merge the training and the test datasets to create 3 datasets.
df_raw_measurements <- rbind(df_train_measurements, df_test_measurements)
df_raw_activities <- rbind(df_train_activities, df_test_activities)
df_raw_subjects <- rbind(df_train_subjects, df_test_subjects)

# Load activity labels & features (variable labels)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels$V2 <- as.character(activity_labels$V2)
features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

# Set meaningful column names
colnames(df_raw_activities) <- "Activity"
colnames(df_raw_subjects) <- "Subject"
colnames(df_raw_measurements) <- features$V2

# Extracts only the measurements on the mean and standard deviation for each measurement.
df_selected_measurements <- df_raw_measurements[grep(".*mean.*|.*std.*", names(df_raw_measurements))]

# Merge the 3 datasets together into a single large dataset.
df_complete <- cbind(df_raw_subjects,df_raw_activities, df_selected_measurements)

# Change activities & subjects into factors to add meaningful names
activity_labels$V2 <- gsub("_", " ", activity_labels$V2)
df_complete$Activity <- factor(df_complete$Activity, levels = activity_labels$V1, labels = activity_labels$V2)
df_complete$Subject <- as.factor(df_complete$Subject)

# Modify column names to make them more meaningful.
names(df_complete) <- gsub("^t", "Time", names(df_complete))
names(df_complete) <- gsub("^f", "Frequency", names(df_complete))
names(df_complete) <- gsub("-mean\\(\\)", "Mean", names(df_complete))
names(df_complete) <- gsub("-std\\(\\)", "StdDev", names(df_complete))
names(df_complete) <- gsub("-freq\\(\\)", "Freq", names(df_complete))
names(df_complete) <- gsub("-", "", names(df_complete))

# View the final tidy dataset and print dimentions
#View(df_complete)
#print(paste("complete: ", dim(df_complete)))

# Load plyr library
library(plyr)
# Aggregate data frame to calculate the mean value for each activity for each activity for each subject
df_tidy_means <- aggregate(df_complete[-c(1,2)], by=list(Activity = df_complete$Activity, Subject=df_complete$Subject), mean)

# View the tidy dataset with mean values and print dimentions
View(df_tidy_means)
#print(paste("complete: ", dim(df_tidy)))

# Write the tidy dataset to file
write.table(df_tidy_means, "tidy_means.txt", row.names=FALSE)

