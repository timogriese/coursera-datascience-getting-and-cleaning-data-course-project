###################################################################
# 1. Merges the training and the test sets to create one data set #
###################################################################

# read global data
activityLabel<-read.delim("./activity_labels.txt", header=FALSE, sep="")
features<-read.delim("./features.txt", header=FALSE, sep="")

# read test data
subject_test<-read.delim("./test/subject_test.txt", header=FALSE, sep="")
X_test<-read.delim("./test/X_test.txt", header=FALSE, sep="")
y_test<-read.delim("./test/y_test.txt", header=FALSE, sep="")

# read training data
subject_train<-read.delim("./train/subject_train.txt", header=FALSE, sep="")
X_train<-read.delim("./train/X_train.txt", header=FALSE, sep="")
y_train<-read.delim("./train/y_train.txt", header=FALSE, sep="")

# merge test and training data
subject<-rbind(subject_test, subject_train)
X<-rbind(X_test, X_train)
y<-rbind(y_test, y_train)

#############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement #
#############################################################################################

featuresWithMeanOrStd<-grep("(mean|std)\\(", features$V2)
XWithMeanOrStd<-X[,featuresWithMeanOrStd]

#############################################################################
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################

activityNames<-as.data.frame(merge(activityLabel, y)$V2)

########################################################################
# 4. Appropriately labels the data set with descriptive variable names #
########################################################################

names(subject)<-c("subjectID")
names(activityNames)<-c("activityName")
names(XWithMeanOrStd)<-features[featuresWithMeanOrStd,]$V2

###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set #
#    with the average of each variable for each activity and each subject     #
###############################################################################

raw<-cbind(subject, activityNames, XWithMeanOrStd)
final<-aggregate(raw[,3:NCOL(raw)], raw[,1:2], mean, simplify = T)

#####################################################################################
# 6. Write the resulting data set to a file called out.txt in the current directory #
#####################################################################################

write.table(final, file = "out.txt", row.names=FALSE)