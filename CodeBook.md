## CodeBook

 This book describes the variables, the data, and any transformations that was performed to clean up the data and become the tidy data


* Data

 As input data were data which you can downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/subject_train.txt': Subject set.

- 'train/y_train.txt': Training labels (activities).

- 'test/X_test.txt': Test set.

- 'test/subject_test.txt': Subject set.

- 'test/y_test.txt': Test labels (activities).

* variables

- label - data.frame which defines column names (and its number) in test and train sets  

- str  - list of column names from 'label'

- m0 - list of column numbers, which contains mean()

- s0 - list of column numbers, which contains std()

- sum - full list of column numbers

- colNa<-vector()

- d<-length(sum)

- i,j

- colNam<-vector()

- train - train data (only mean and std)

- test - test data (only mean and std)

- trainAct - train activity data

- testAct - test activity data

- trainSubj - subject train data

- testSubj - subject test data

- mergedTrain - test+ train data

- mergedAct - test+train activity data (numbers)

- mergedSubj - test+train subject data

- mergedActivity -  test+train activity data (text)

- mergedWithAct - full data set (train, activity, subject with names for each column)

- cln - column names vector

- tst - reshaped by "Activity","Subject" data set 

- tinyData - result


* transformations

1. Read the data from features.txt - become the data frame, contains numbers and names of columns
2. Become a list of column numbers, which contains mean() or std(), sort it
3. For faster the data reading, create a list of column type, which have to be loaded in R. If not needed to import - NULL
4. Using read.table with parameter colClasses read data for train, test sets, activities and subjects
5. merge data from step 4
6. Become a list of column names for full table and set it
7. Melt and cast data set from step 6 - tiny data

Used functions:

- read.table

- as.character

- grep

- sort

- length

- rbind

- cbind

- melt

- dcast

- write.table