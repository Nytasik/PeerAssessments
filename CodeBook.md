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

- label<-read.table("./data/UCI HAR Dataset/features.txt")

- str<-as.character(label[,2])

- m0<-grep("mean()",str, fixed = TRUE)

- s0<-grep("std()",str, fixed = TRUE)

- sum<-sort(c(m0,s0))

- colNa<-vector()

- d<-length(sum)

- i,j

- colNam<-vector()

- d<-length(sum)

- train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",
                  colClasses=colNa)

- test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",
                 colClasses=colNa)

- trainAct<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")

- testAct<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")

- trainSubj<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

- testSubj<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

- mergedTrain<-rbind(train,test)

- mergedAct<-rbind(trainAct,testAct)

- mergedSubj<-rbind(trainSubj,testSubj)

- mergedActivity

- labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

- mergedWithAct<-cbind(mergedTrain,mergedActivity,mergedSubj)

- colName<-c(colNam,"Activity","Subject")

- cln<-vector()

- tst<-melt(mergedWithAct,id.vars=c("Activity","Subject"),
          measure.vars = cln)

- tinyData<-dcast(tst,Activity + Subject ~ variable,mean)


* transformations

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