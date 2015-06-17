summarize_subj_act <- function(activities)
{
  # create a list of subjects
  subs <- unique(activities$SUBJECT)
  
  one_subject <- NULL   # part of the dataset pertaining to one subject
  one_action <- NULL  # individual action within the subject dataset
  column_means <- NULL
  combined_column_means <- NULL
  
  for (i in subs)
  {
    one_subject <- subset(activities, activities$SUBJECT == i)
    
    acts <- unique(activities$ACTION)
    
    for (j in acts)
    {
      one_action <- subset(one_subject, one_subject$ACTION == j)
      
      column_means <- colMeans(one_action[1:561])
            
      column_means <- c(column_means, i, j)
      
      column_means[562] <- as.integer(column_means[562])
      column_means[563] <- as.integer(column_means[563])
      
      combined_column_means <- rbind(combined_column_means,column_means)

       
      
    }
    
    
    
  }
  
  combined_column_means
}

run_analysis <- function()
{

   #reading the training data  
   train_data <- read.table("X_train.txt") 
   
   # read the list of measurements
   features <- read.table("features.txt")  
   
   #measurement names become column names
   colnames(train_data) <- features[[2]]
   
   #read in subject numbers
   train_subjects <- read.table("subject_train.txt")
   
   #create a column of 'subjects'   
   train_data$SUBJECTS <- train_subjects[[1]]
   
   #read a column of actions 1 through 5
   train_action <- read.table("y_train.txt")
   
   #create a column of "actions"
   train_data$ACTION <- train_action[[1]] 
   
   
   #read test data
   test_data <- read.table("X_test.txt")
   
   #add column names
   colnames(test_data) <- features[[2]]  
   test_subjects <- read.table("subject_test.txt")
    
   #add subject numbers
   #adding arbitrary number (30) to give test subject different subject numbers
   #from training data
   test_data$SUBJECTS <- test_subjects[[1]] + 30
   
   #complete list of subjects
   totalsubjects <- c(train_data$SUBJECTS, test_data$SUBJECTS)
   
   #read list of test actions 1 to 6
   test_action <- read.table("y_test.txt")
   
   #add the ACTion column
   test_data$ACTION <- test_action[[1]]
   
   
   combined_set <- rbind(train_data, test_data)
   
   summary <- summarize_subj_act(combined_set)
   
   write.csv(summary, "summary.csv")
   write.table(summary, "summary.txt", row.names = FALSE)
   
   # return the mean of all columns
   colMeans(rbind(train_data, test_data)[1:561])
}
