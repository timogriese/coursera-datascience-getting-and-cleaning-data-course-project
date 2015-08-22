###################################################################
# 1. Merges the training and the test sets to create one data set #
###################################################################

The data is read as is without any modification. The naming of the variables
is similiar to original file name for easy reference.

After loading the data set as is the test and train data sets are
combined using the rbind command which results in a union of test and 
train data sets with the test rows followed by the train rows.

#############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement #
#############################################################################################

Using a single grep command all features that contains mean or std followed by a backslash ("\") 
in the name are identified an the corresponding indices are used to select only the corresponding
colums from the in 1. loaded complete set.
The variable "XWithMeanOrStd" contains the filtered data set after this step and must be used
for further processing instead of the "X" variable.

#############################################################################
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################

The rows from the variable "activityLabel" are merged with the "y" variable using the merge command.
From the result of the merge command only the second column is kept and stored as a data frame
in the variable "activityNames".

########################################################################
# 4. Appropriately labels the data set with descriptive variable names #
########################################################################

The column titles for the variables subject, activityNames and XWithMeanOrStd are set using the 
names command.

###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set #
#    with the average of each variable for each activity and each subject     #
###############################################################################

To prepare for the last step a raw data set is created without aggregation and stored in the 
"raw" variable. The "raw" variable is created using the cbind command which binds the columns of 
the supplied data sets together. The naming of the columns (steps 3. and 4.) is preserved.

As the final step the aggregation is computed using the aggregate command with the first two columns, which are the subjectID and the 
corresponding activityName, as keys and the mean function to is used for all following columns.
The aggregation result is stored in the "final" variable.

#####################################################################################
# 6. Write the resulting data set to a file called out.txt in the current directory #
#####################################################################################

The aggregation result from the "final" variable is written to the file called "out.txt" 
using the write.table command.