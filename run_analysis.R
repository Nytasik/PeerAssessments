label<-read.table("./data/UCI HAR Dataset/features.txt")
str<-as.character(label[,2])

m0<-grep("mean()",str, fixed = TRUE)
s0<-grep("std()",str, fixed = TRUE)
sum<-sort(c(m0,s0))

colNa<-vector()
d<-length(sum)
for (i in 1:561){
  for (j in 1:d){
    if (i==sum[j]) {
      colNa[i]<-"numeric"
      break
    }  
    else colNa[i]<-"NULL"
  }
}
colNam<-vector()
d<-length(sum)
  for (i in 1:d){
      colNam[i]<-str[sum[i]]
    }  

train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",
                  colClasses=colNa)
test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",
                 colClasses=colNa)
trainAct<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
testAct<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
trainSubj<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
testSubj<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

mergedTrain<-rbind(train,test)
mergedAct<-rbind(trainAct,testAct)
mergedSubj<-rbind(trainSubj,testSubj)
labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

d<-dim(mergedAct)

mergedActivity<-vector()
for (i in 1:d[1]){
  for (j in 1:6){
    if (mergedAct[i,1]==labels[j,1]){
      mergedActivity[i]<-as.character(labels[j,2])
      break
    }
  }  
}

mergedWithAct<-cbind(mergedTrain,mergedActivity,mergedSubj)

colName<-c(colNam,"Activity","Subject")
colnames(mergedWithAct)<-colName

cln<-vector()
for (i in 1:66){
  cln<-c(cln,colNam[i])
}

tst<-melt(mergedWithAct,id.vars=c("Activity","Subject"),
          measure.vars = cln)
tinyData<-dcast(tst,Activity + Subject ~ variable,mean)

write.table(tinyData,"./data/UCI HAR Dataset/tinyData.txt")