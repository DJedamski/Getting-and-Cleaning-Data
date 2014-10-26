Overview
========================================================

This repository contains the script run_analysis.R and the code book pertaining to the course project for Dr. Leek, Dr. Peng, and Dr. Gaffo's 'Getting and Cleaning Data' course.

The purpose of this project is to learn and demonstrate how to aggregate and clean messy data.

Project Deliverables
====================================================

The run_analysis.R script in this repository does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Notes
===============================

Only four steps are required to accomplish the goals of the project and generate the final text file.

1. Download the data and store it in a folder on your local drive
2. Change the working direction within setwd() in the run_analysis.R script to the folder where the data is stored
3. Change the location where you want the final text file written out to (within write.table() function at the end of the script)
4. Run the rest of the script

See codebook.md for additional details.
