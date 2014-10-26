# Set the working directory

setwd('/Users/Derek/Desktop/Coursera Project/')

# Read in the features file and subset it to
# only grab the features we are interested in

features<-read.table('features.txt', sep='')
interest<-grepl("mean|std",features[,2])
features<-features[interest,]

# The following code takes care of:
# 1) Read in the training/test data
# 2) Subset the dataset to grab only the mean/std features
# 3) Read in the activities into that same data frame
# 4) Read in the subjects into that same data frame

training<-read.table('X_train.txt', sep='')
training<-training[,interest]
training[,80]<-read.table('Y_train.txt', sep='')
training[,81]<-read.table('subject_train.txt', sep='')

test<-read.table('X_test.txt', sep='')
test<-test[,interest]
test[,80]<-read.table('Y_test.txt', sep='')
test[,81]<-read.table('subject_test.txt', sep='')

# Read in the features data set and name our columns

combined_data<-rbind(training,test)
names(combined_data)<-features[,2]
names(combined_data)[80]<-'Activity'
names(combined_data)[81]<-'Subject'

# Create an activities function in order to transform
# the activites codes into the activity descriptions
#
# This is used in place of merging the activity_labels
# file because the merging will cause re-ordering

activities <- function(data) {
	data$Activity[data$Activity == 1] = 'WALKING'
	data$Activity[data$Activity == 2] = 'WALKING UPSTAIRS'
	data$Activity[data$Activity == 3] = 'WALKING DOWNSTAIRS'
	data$Activity[data$Activity == 4] = 'SITTING'
	data$Activity[data$Activity == 5] = 'STANDING'
	data$Activity[data$Activity == 6] = 'LAYING'
	return(data)
}

combined_data<-activities(combined_data)

# Prepare to calculate the mean of each column
# for each subject and activity by installing
# the package reshape2 which contains the
# dcast function

install.packages('reshape2')
library(reshape2)

TD <- melt(combined_data,id.vars=c('Activity','Subject'))
tidy_dataset <- dcast(TD, Subject + Activity ~ variable, mean)

# Write out the final dataset

write.table(tidy_dataset, file='./tidy_dataset.txt', sep=',', row.name=FALSE)


