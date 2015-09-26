Getting and Cleaning Data Course Project CodeBook
=================================================

The dataset includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.


*subject_test, X_test, Y_test, subject_train, X_train, Y_train - initial data, class - data.frame
dim(subject_test)
[1] 2947    1
dim(X_test)
[1] 2947  561
dim(Y_test)
[1] 2947    1
dim(subject_train)
[1] 7352    1
dim(X_train)
[1] 7352  561
dim(Y_train)
[1] 7352    1
*subject, X.all, Y.all - merged data,  class - data.frame
dim(subject)
[1] 10299     1
dim(X.all)
[1] 10299    79
dim(Y.all)
[1] 10299     2
*features  - features data, initial and then subsetted,  class - data.frame
*activities - initial activities data,  class - data.frame
*mn.std.features.ind - indices of features which contain mean or std, class - integer
*X.all - subsetted data, which contains relevant columns, class - data.frame
*Y.all - named activities, class - data.frame
*nicenames - names to assign to X.all, class - character
*result - the result of the step 4, merged data, class - data.frame
dim(result)
[1] 10299    81
*melted.data - data, generated from the result, to use in dcast function, class - data.frame
*all.means - final data, class - data.frame
dim(all.means)
[1] 180  81

