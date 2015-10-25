file<- read.csv("repdata-data-StormData.csv")
head(file)
summary(file)
max(file$EVTYPE)


file<- read.table("./UCI HAR Dataset/test/X_test.txt")
head(file)
file
file2 <- read.table("./UCI HAR Dataset/test/y_test.txt")
(file2)
features<- read.table("./UCI HAR Dataset/features.txt")
head(features)
features
features_info <-read.table("./UCI HAR Dataset/features_info.txt")
features_info
activity_lable <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_lable
subject_train <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train
head(subject_train)
summary(subject_train)
X_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
head(X_train)
X_train
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
head(y_train)
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_x_train
head(body_acc_x_train)

body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
(body_acc_x_train)
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
head(body_gyro_x_train)

subject_train_splited <- split(subject_train, subject_train$V1)
nrow(subject_train_splited$`4`)
nrow(subject_train_splited$`2`)
nrow(subject_train_splited$`9`)









