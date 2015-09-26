setwd("~/Coursera/DataScience/Getting and cleaning data/Assignment/UCI HAR Dataset")
#load test data
subject_test = read.table("./test/subject_test.txt")
X_test = read.table("./test/X_test.txt")
Y_test = read.table("./test/Y_test.txt")
#load train data
subject_train = read.table("./train/subject_train.txt")
X_train = read.table("./train/X_train.txt")
Y_train = read.table("./train/Y_train.txt")

#understanding size
dim(subject_test)
dim(X_test)
dim(Y_test)
dim(subject_train)
dim(X_train)
dim(Y_train)

##Step 1: Merge the training and the test sets to create one data set
subject <- rbind(subject_test, subject_train)
X.all <- rbind(X_test,X_train)
Y.all <- rbind(Y_test,Y_train)

#remove unnecessary data from the memory
rm(X_test, X_train, Y_test, Y_train, subject_test, subject_train)

features <- read.table("features.txt", col.names=c("Id", "Label"))
activities <- read.table("activity_labels.txt", col.names=c("Id", "Label"))
dim(features)
dim(activities)

##Step 2: Extract the measurements on the mean and standard deviation for each measurement

#get all indices of lines containing mean and std (including "meanFreaq" but excluding "angle(  ,gravityMean)" )
mn.std.features.ind <- grep("mean()|std()",features$Label)
#get required data
X.all <- X.all[,mn.std.features.ind]
features <- features[mn.std.features.ind,]

##Step 3: Use descriptive activity names to name the activities in the data set

#merge Y.all with activities
Y.all <- cbind(Y.all, activities[Y.all[, 1], 2])
names(Y.all)<-c("activity.ID", "activity.Label")

##Step 4: Appropriately labels the data set with descriptive variable names. 
#set names to X
nicenames<- sapply(features$Label, function(x) { gsub("-", ".", gsub("\\(\\)", "", gsub("mean", "Mean", gsub("std", "Std", x))))})
names(X.all) <- nicenames
rm(nicenames)
names(subject) <- "subject.ID"

##Step 4: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
result <- cbind(subject, Y.all$activity.Label, X.all)
names(result)[2] <- "activity.Label"
write.table(result,"Step_4_result.txt", row.name=FALSE)

##Step 4: From the data set in step 4, create a second, independent tidy data set 
##        with the average of each variable for each activity and each subject
#if you don't have package reshape2 installed - install it
library(reshape2)
melted.data <- melt(result, id=c("subject.ID","activity.Label"))
all.means <- dcast(melted.data, subject.ID + activity.Label ~ variable, mean)
write.table(all.means,"Step_5_result.txt", row.name=FALSE)
