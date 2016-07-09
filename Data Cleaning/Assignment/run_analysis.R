
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
df_train <- read.table("UCI HAR Dataset/train/X_train.txt")
df_train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
df_train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load the test dataset, activities and subjects
df_test <- read.table("UCI HAR Dataset/test/X_test.txt")
df_test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
df_test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1) Merge the training and the test datasets to create 3 datasets.
df_raw <- rbind(df_train, df_test)
df_raw_activities <- rbind(df_train_activities, df_test_activities)
df_raw_subjects <- rbind(df_train_subjects, df_test_subjects)

# Load activity labels & features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels$V2 <- as.character(activity_labels$V2)
features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

# Set meaning full column names
colnames(df_raw) <- features$V2
colnames(df_raw_activities) <- "Activity"
colnames(df_raw_subjects) <- "Subject"

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
df_selected <- df_raw[grep(".*mean.*|.*std.*", names(df_raw))]

# Merge the 3 datasets together into a single large dataset.
df_complete <- cbind(df_raw_subjects,df_raw_activities, df_selected)

# 3) Uses descriptive activity names to name the activities in the data set
# Turn activities & subjects into factors
activity_labels$V2 <- gsub("_", " ", activity_labels$V2)
df_complete$Activity <- factor(df_complete$Activity, levels = activity_labels$V1, labels = activity_labels$V2)
df_complete$Subject <- as.factor(df_complete$Subject)

# 4) Appropriately labels the data set with descriptive variable names.
# Change t to Time, f to Frequency, mean() to Mean and std() to StdDev
# Remove extra dashes and BodyBody naming error from original feature names
names(df_complete) <- gsub("^t", "Time", names(df_complete))
names(df_complete) <- gsub("^f", "Frequency", names(df_complete))
names(df_complete) <- gsub("-mean\\(\\)", "Mean", names(df_complete))
names(df_complete) <- gsub("-std\\(\\)", "StdDev", names(df_complete))
names(df_complete) <- gsub("-", "", names(df_complete))

View(df_complete)
print(paste("complete: ", dim(df_complete)))

# 5) Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
df_tidy = aggregate(df_complete[-c(1,2)], by=list(Activity = df_complete$Activity, Subject=df_complete$Subject), mean)
View(df_tidy)

# Write tidy dataset to file
write.table(tidyMeans, "tidy.txt", row.names = False)

