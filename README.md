# run_analysis

This file reads in the following files

Training data

X_train.txt - training data with 561 observations
subject_train.txt - list of subjects (known by number) from which the observations were obtained
y_train.txt - list of actions performed by each of the subjects
features.txt - names for the 561 observations

Test data

X_test.txt- test data with 561 observations
subject_test.txt - list of subjects (known by number) from which the observations were obtained
y_test.txt - list of actions performed by each of the subjects
features.txt - the same file as above

File Actions

1) This file adds subject numbers and actions as columns next to the 561 observation columns for training and test data 
above.

2) The training and test set are joined together

3) The file calculates mean and standard deviation for each measurement - these values are returned by 
the run_analysis() function.   They are returned as a list of two vectors 561 values each.

4) Creates a file with an average for each activity for each subject - a .csv and a .txt files are created.


Variables used:

from run_analysis()
  
train_data - 561 different measurements from the training dataset
features - list of measurement names
train_subjects - list of training dataset subjects by number
train_action - list of actions (numbered from 1 to 6) take by subjects   

test_data - these three correspond to the above but for the test dataset
test_subjects
test_action

totalsubjects - list of subjects from both datsets
combined_set - data set comprising both data sets
summary - data frame containing mean for each measurement for each subject  - reducing the original
data set from multiple measurements for the same action for each subject
   
from summarize_subj_act()

subs - a list of subjects used - with each subject appearing once
activities - corresponding to combined_set above
one_subject -  part of the dataset pertaining to one subject
one_action  - individual action within the subject dataset
column_means <- means for each column for all measurements of a particular action for a subject
combined_column_means - the reduced data set - this variable is returned by this function
  
  
