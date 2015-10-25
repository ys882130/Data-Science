

## *** BEFORE USING THE FOLLOWING SCRIPT YOU WILL HAVE TO DOWNLOAD 
## THE ZIP FILE FROM THE LINK AND UNZIP IT IN THE WORKING DIRECTORY ***


## PART 1 - Merging the training and the test sets to create one data set.

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
merge_data <- rbind(train_data, test_data)

  ## Test
  head(merge_data)
  nrow(merge_data)
  nrow(train_data) + nrow(test_data)

## PART 2 - Extracting only the measurements for the mean and standard deviation for each measurement // 

mean_and_sd <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_sd_data <- merge_data[, mean_and_sd[,1]]
  
  ## Test
  head(mean_and_sd_data)

## PART 3 - Using descriptive activity names to name the activities in the data set
  
features<- read.table("./UCI HAR Dataset/features.txt")
descriptive_name <- merge_data
colnames(descriptive_name) <- features$V2
  
  ## Test
  colnames(descriptive_name)  

## PART 4 - Appropriately labels the data set with descriptive variable names.

label_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
label_data <- rbind(activity_test, activity_train)
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(labels)) {
  code <- (labels[i, 1])
  name <- as.character(labels[i, 2])
  label_data[label_data$activity == code, ] <- name
}
data_with_labels <- cbind(label_data, merge_data)

  ## Test
  data_with_labels[,1]

## PART 5 - independent tidy data set with the average of each variable for each activity and each subject.

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subject <- rbind(subject_test, subject_train)
sort_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
sort_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
sort_data <- rbind(sort_test, sort_train)
averages <- aggregate(sort_data, by = list(activity = label_data[,1], subject = subject[,1]), mean)
write.table(averages, file='GACD_project.txt', row.names=FALSE)
  
  ## Test
  averages[, 1:2]
  read.table("GACD_project.txt")





