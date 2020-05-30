# Load the reshape2 package, required later
library(reshape2)

# Read data into data frames
subject_train <- read.table("data/subject_train.txt")
subject_test <- read.table("data/subject_test.txt")
X_train <- read.table("data/X_train.txt")
X_test <- read.table("data/X_test.txt")
y_train <- read.table("data/y_train.txt")
y_test <- read.table("data/y_test.txt")

# Add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# Add column names for measurement files
featureNames <- read.table("data/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# Add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"

# Combine files into one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)

# Search and find columns that contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
    grepl("std\\(\\)", names(combined))

# Keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

# Remove unnecessary columns
combined <- combined[, meanstdcols]

# Convert the activity column into a factor column
combined$activity <- factor(combined$activity, labels=c("Walking",
                                                        "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# Create the tidy data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

# Write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)