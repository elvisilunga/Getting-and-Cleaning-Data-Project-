require("data.table") 
require("reshape2") 
 

# Loading activity labels 
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2] 
 

# Loading the data column names 
  features <- read.table("./UCI HAR Dataset/features.txt")[,2] 
 

# Extracting only the measurements on the mean and standard deviation for each measurement. 
  extract_features <- grepl("mean|std", features) 


# Loading and process X_train and Y_train data
   X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
   Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt") 
 

  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
 

  names(X_train) = features 
 

 # Extracting only the measurements on the mean and standard deviation for each measurement. 
   X_train = X_train[,extract_features] 
 

 # Loading activity data 
   Y_train[,2] = activity_labels[Y_train[,1]] 
   names(Y_train) = c("Activity_ID", "Activity_Label") 
   names(subject_train) = "subject" 


 # Binding the data 
   train_data <- cbind(as.data.table(subject_train), Y_train, X_train)

  # Loading and process X_test and Y_test data
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") 
  Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt") 
  
  
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
 

  names(X_test) = features 
 

 # Extracting only the measurements on the mean and standard deviation for each measurement. 
 X_test = X_test[, extract_features] 
 

# Loading activity labels 
  Y_test[,2] = activity_labels[Y_test[,1]] 
  names(Y_test) = c("Activity_ID", "Activity_Label") 
  names(subject_test) = "subject" 
 

  # Binding data 
    test_data <- cbind(as.data.table(subject_test), Y_test, X_test)  

 
# Merging test and training data 
  data = rbind(test_data, train_data) 
 

 id_labels   = c("subject", "Activity_ID", "Activity_Label") 
 data_labels = setdiff(colnames(data), id_labels) 
 melt_data      = melt(data, id = id_labels, measure.vars = data_labels) 
 

 # Apply mean function to dataset using dcast function 
   tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean) 
 

   write.table(tidy_data, file = "./tidy_data.txt") 
