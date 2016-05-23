# Data source:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
download.file(url, file.path(path, f))

#unzip the file

# 1. Merges the training and the test sets to create one data set.
trainSubject <- read.table("train/subject_train.txt")
testSubject <- read.table("test/subject_test.txt")
trainActivity <- read.table("train/Y_train.txt")
testActivity <- read.table("test/Y_test.txt")
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

#merge
S <- rbind(trainSubject, testSubject)
setnames(S, "V1", "subject")
A <- rbind(trainActivity, testActivity)
setnames(A, "V1", "activityNum")
D <- rbind(train, test)

#merge columns
subject <- cbind(S, A)
data <- cbind (subject, D)

setkey(data, subject, activityNum)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
setnames(features, names(features), c("featureNum", "featureName"))
smean <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
data <- data[, smean]
features$featureCode <- features[, paste0("V", featureNum)]

#3. Uses descriptive activity names to name the activities in the data set
al <- read.table("activity_labels.txt")
al[, 2] = gsub("_", "", tolower(as.character(al[, 2])))
A[,1] = al[A[,1], 2]

#4. Appropriately labels the data set with descriptive variable names.
names(A) <- "activity"
cleaned <- cbind(subject, A, data)
write.table(cleaned, "merged_clean_data.txt")
merged <- read.table("merged_clean_data.txt")
head(merged)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(al[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = al[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==al[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "data_set_with_the_averages.txt")