# Getting-and-Cleaning-Data-Project-
Course Project

Steps taken to work on this course project
1.Download the data source and put into a folder on the local drive, and get a  UCI HAR Dataset  folder.
2.Create the  run_analysis.R script file  in the parent folder of  UCI HAR Dataset and run it so that it generates a new file called
  tiny_data.txt  in the working directory.


The five main stages in the run_analysis are:

1.Merging the two data sets training and the test sets to create one data set.
2.Extraction of the measurements on the mean and standard deviation only for each measurement.
3.Introduction of descriptive activity names to name the activities in the data set
4.Labelling the data set with appropriate descriptive activity names.
5.Creation of a second, independent tidy data set with the average of each variable for each activity and each subject.

Implementation of different steps through run_analysis.R

•Require  reshapre2  and  data.table  librareis
•Load both training and test data
•Load the features and activity labels
•Extract the mean and standard deviation column names and data
•Process the data
•Merge data set.

