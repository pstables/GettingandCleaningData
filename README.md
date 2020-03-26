**"Getting and Cleaning Data"** 

## Data
This script downloads (if not already done so) and tidies data from:

[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

The downloaded zip file comprises:
***features.txt*** contains the column names of the observations
***train/X_train.txt*** contains the training set of data observations
***test/X_test.txt*** contains the test set of data observations
***train/subject_train.txt*** contains the subject for the training data
***test/subject_test.txt*** contains the subject for the test data
***train/y_train.txt*** contains the activity number for the training data
test/y_test.txt*** contains the actvity number for the test data


## Script

1. Checks if the data file exists and if not downloads the file to the directory.
2. Unzips the file
3. Reads the various files into data frames:
        
        data.train.x = training data
        data.train.activity = training activity
        data.train.subject = training subject
        
        data.test.x = test data
        data.test.activity = test activity
        data.test.subject = test subject

4. Combines the training data, activity and subject into a new data frame data.train
5. Combines the test data, activity and subject into a new data frame data.test
6. Merges data.train and data.test into a single data frame, data.
7. Selects only columns which refer to means or standard deviations
8. Renames the columns to easily readable names
9. Creates a text file of the tidy data and saves it to the working directory

