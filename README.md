This file describes how it all works.
=================================================

Make sure that you've downloaded data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Also please install reshape2 package.
Theprocess is straithforward:
- We load data, 
- merge initial variables, 
- subset the initial variables to get mean and std data, 
- assign convenient names to variables,
- merge the data to get the tidy data,
- calculate the mean for each combination of activity and subject.

Please see the code for the details
