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

3) The file calculates mean and standard deviation (TODO) for each measurement - these values are returned by 
the run_analysis() function.  

4) Creates a file with an average for each activity for each subject - a .csv and a .txt files are created.

