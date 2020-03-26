if(!file.exists('./dataSet.zip')){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, "dataset.zip")
        unzip("dataset.zip")
}

features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2] )

data.train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
data.train.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
data.train.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

data.train <-  data.frame(data.train.subject, data.train.activity, data.train.x)
names(data.train) <- c(c('subject', 'activity'), features)

data.test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
data.test.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
data.test.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

data.test <-  data.frame(data.test.subject, data.test.activity, data.test.x)
names(data.test) <- c(c('subject', 'activity'), features)

data <- rbind(data.test, data.train )

cols.mean.sd <- grep("mean|std",names(data))

data.mean.sd<-data[,c(1,2,cols.mean.sd)]

activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
data.mean.sd$activity <- activity.labels[data.mean.sd$activity]

new_name <- names(data.mean.sd)
new_name <- gsub("[(][)]", "", new_name)
new_name <- gsub("^t", "Time_", new_name)
new_name <- gsub("^f", "Frequency_", new_name)
new_name <- gsub("Acc", "Accelerometer", new_name)
new_name <- gsub("Gyro", "Gyroscope", new_name)
new_name <- gsub("Mag", "Magnitude", new_name)
new_name <- gsub("-mean-", "_Mean_", new_name)
new_name <- gsub("-std-", "_Standard_Deviation_", new_name)
new_name <- gsub("-", "_", new_name)
names(data.mean.sd) <- new_name

tidy <- aggregate(data.mean.sd[,3:81], by = list(activity = data.mean.sd$activity, subject = data.mean.sd$subject),FUN = mean)
write.table(x = tidy, file = "tidy data.txt", row.names = FALSE)


