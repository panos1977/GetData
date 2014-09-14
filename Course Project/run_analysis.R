# Read the train and test data files from our current directory
setwd("UCI HAR Dataset\\train")
train_sub <- read.table("subject_train.txt", sep = "")
train_x <- read.table("X_train.txt", sep = "")
train_y <- read.table("Y_train.txt", sep = "")
setwd("..\\test")
test_sub <- read.table("subject_test.txt", sep = "")
test_x <- read.table("X_test.txt", sep = "")
test_y <- read.table("Y_test.txt", sep = "")

# Step.1 - Merge the training and the test data sets
dt_sub <- rbind(train_sub, test_sub)
dt_x <- rbind(train_x, test_x)
dt_y <- rbind(train_y, test_y)

# Step.2 - Extracts only the measurements on the mean and Std
setwd("..")
features <- read.table("features.txt", sep = "")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
dt_x <- dt_x[, meanStdIndices]

# Step.3 - Uses descriptive activity names to name the activities in the data set
activity_names <- read.table("activity_labels.txt", sep = "")
activitynames <- activity_names[dt_y$V1, 2]
dt_y$V1 <- tolower(activitynames)

# Step.4 - Appropriately labels the data set with descriptive variable names
names(dt_sub) <- "subject"
names(dt_y) <- "activity"
names(dt_x) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 
names(dt_x) <- gsub("mean", "Mean", names(dt_x)) 
names(dt_x) <- gsub("std", "Std", names(dt_x))
names(dt_x) <- gsub("-", "", names(dt_x))
dt <- cbind(dt_sub, dt_y, dt_x)

# Step.5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject
numact <- nrow(activity_names)
numsub <- nrow(table(dt_sub))
datasub <- split(dt, dt$subject)
tidydt <- data.frame()
for (i in 1:numsub) {
	dataact <- split(datasub[[i]][], datasub[[i]]$activity)
	for(j in 1:numact) {
		means <- apply(dataact[[activity_names[j, 2]]][-c(1, 2)], 2, mean)
		tidydt <- rbind(tidydt, c(i, j, means))
	}
}
names(tidydt) <- names(dt)
activitynames <- activity_names[tidydt$activity, 2]
tidydt$activity <- tolower(activitynames)
write.table(tidydt, "tidy_dataset.txt", row.name = FALSE)