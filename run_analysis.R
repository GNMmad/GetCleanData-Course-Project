## Data loading
if (!file.exists("data.zip")) {
  ## Data zip file does not exist in wd
  ## Download file from website
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, destfile = "data.zip")
}
# Unzip downloaded file
if (!file.exists("./data")){
  unzip("./data.zip", exdir = "./data")
}

## Load test set data files
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
## Load train set data files
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
## Load activities and features (variables) data
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

## subject_test, x_test, y_test have same number of rows 2947
## subject_train, x_train, y_train have same number of rows 7352
## x_test and x_train have same number of cols 561

## 1. Merge the training and the test sets to create one data set.
## Data frames with same number of columns can be merged
##   subject_test + subject_train (subjects)
##   x_test + x_train (measurements)
##   y_test and y_train (activities)

## Bind data frames subject_test and subject_train by rows
## Merge rows of subjects from both data sets
subject_test_and_train <- rbind(subject_test,subject_train)
## Merge rows of measurements from both data sets
x_test_and_train <- rbind(x_test,x_train)
## Merge rows of activities from both data sets
y_test_and_train <- rbind(y_test,y_train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

## Package dplyr will be used
library(dplyr)
## According to features_info.txt, measurements on the mean and standard deviation 
## are identified by features contaning "mean()" and "std()", respectively.
mean_and_std_features <- filter(features,grepl('mean\\(\\)',V2) | grepl('std\\(\\)',V2))
## Subset prueba x_test_and_train, only 66 columns with index numbers related to filtered features 
## (filtered_features$V1) are selected, the rest are discarded. 
x_test_and_train <- select(x_test_and_train, mean_and_std_features$V1)

## 3. Uses descriptive activity names to name the activities in the data set
## Naming activities
activity_labels$V2 <- tolower(activity_labels$V2)
activity_labels$V2 <- gsub('_'," ", activity_labels$V2) 
for (i in 1:nrow(activity_labels)) {
  y_test_and_train[,1] <- activity_labels$V2[i]
}

## 4. Appropriately labels the data set with descriptive variable names. 
## Rename variables for measurements: lowercase, subsituting abreviations, leading t by time_,
## leading f by frequency_, mean() by mean, std() by stddeviation, as follow:
mean_and_std_features$V2 <- gsub('Acc', "acceleration", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('Mag', "magnitude", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('Body', "body", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('Gyro', "gyro", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('Jerk', "jerk", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('mean\\(\\)', "mean", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('std\\(\\)', "stddeviation", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('^t', "time_", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('^f', "frequency_", mean_and_std_features$V2)
mean_and_std_features$V2 <- gsub('-', "_", mean_and_std_features$V2)
## Naming columns (variables) of data frames
colnames(subject_test_and_train) <- "subject"
colnames(y_test_and_train) <- "activity"
colnames(x_test_and_train) <- mean_and_std_features$V2

## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
## Merge by columns data frames subject_test_and_train, y_test_and_train, x_test_and_train into
## one data frame for test_and_train, group by subject and activity, and summarize each numeric variable

## Tidy data set in data frame calculating mean of each feature grouping by subject and activity
tidy_data_set <- cbind(subject_test_and_train, y_test_and_train, x_test_and_train) %>% 
  group_by(subject, activity) %>% summarise_each(funs(mean))

## Export tidy data set to text file
write.table(tidy_data_set, file = "./UCI HAR Tidy Dataset.txt", row.names = FALSE, sep="|")

## Clean unused data from memory 
rm(list=c("tidy_data_set", "subject_test_and_train", 
          "y_test_and_train", "x_test_and_train"))
rm(list=c("subject_test","subject_train","x_test","x_train","y_test","y_train"))
