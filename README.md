##############################################################################################
# This file is an extension to the "README.txt" included in the data set used for this task. #
# Make sure you read the "README.txt" before going on.                                       #
##############################################################################################

The main script (and the only one needed) for the analysis is "run_analysis.R".

Expectations:
The data resides directly in the working directory.

Result/Output:
The cleaned data set is written to a file called "out.txt" that will be written to the working directory.

Structure of the script:

The scripts structure mimics the tasks given with one extension (6.) for the output of the result:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Write the resulting data set to a file called out.txt in the current directory

The wording in the script code comments is the same as in the task given for easy reference.