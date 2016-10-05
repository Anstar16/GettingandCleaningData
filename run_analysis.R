#Create directory to store dataset file if it did not exist
if(!file.exists("./data")){dir.create("./data")}

#Path of Dataset File
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download dataset file
download.file(fileUrl,destfile="./data/Dataset.zip",method="auto", mode="wb")

#Extract the files from dataset
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Set location of the files
loc <- file.path("./data" , "UCI HAR Dataset")
filelist<-list.files(loc, recursive=TRUE)

#Read the Activity, Subject and Features file data
actTest  <- read.table(file.path(loc, "test" , "Y_test.txt" ),header = FALSE)
actTrain <- read.table(file.path(loc, "train", "Y_train.txt"),header = FALSE)
subjTest  <- read.table(file.path(loc, "test" , "subject_test.txt"),header = FALSE)
subjTrain <- read.table(file.path(loc, "train", "subject_train.txt"),header = FALSE)
ftrTest  <- read.table(file.path(loc, "test" , "X_test.txt" ),header = FALSE)
ftrTrain <- read.table(file.path(loc, "train", "X_train.txt"),header = FALSE)

#Combine the training and test data rows
subjData <- rbind(subjTrain, subjTest)
actData<- rbind(actTrain, actTest)
ftrData<- rbind(ftrTrain, ftrTest)

#Read the feature labels file data
ftrLabels <- read.table(file.path(loc, "features.txt"),head=FALSE)

#Provide column names to the combined dataset
names(subjData)<-c("Subject")
names(actData)<- c("Activity")
names(ftrData)<- ftrLabels$V2

#Combine the subject and activity data columns
colData <- cbind(subjData, actData)
data <- cbind(ftrData, colData)

#Extract only the columns that contain mean or standard deviation measurements
meanStdData<-ftrLabels$V2[grep("mean\\(\\)|std\\(\\)", ftrLabels$V2)]

#Group the meanStdData data by subject and activity
groupNames<-c(as.character(meanStdData), "Subject", "Activity" )
data<-subset(data,select=groupNames)

#Read the activity labels file data
actLabels <- read.table(file.path(loc, "activity_labels.txt"),header = FALSE)

#Label the data set with appropriate names
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub('GyroJerk',"AngularAcceleration",names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data) <- gsub('-mean', 'Mean',names(data))
names(data) <- gsub('-std', 'Std', names(data))
names(data) <- gsub('[()-]', '', names(data))


#Create a tidy dataset with the average value of each subject and activity pair variables
avgValue = ddply(data, c("Subject","Activity"), numcolwise(mean))
write.table(avgValue, file = "tidy.txt", row.names = FALSE, quote = FALSE)