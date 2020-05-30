## Class Project for "Getting and Cleaning Data"

The class project for Getting and Cleaning Data was to read in the "Human Activity Recognition Using Smartphones" data set, perform an analysis on the given data set, and output a new tidy data set.

**The Data, data/**

The data used is all ready presented in the repository (under data/), but if you want to look more closely at the full data set you can download the zip file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
These are the files used in the analysis:
	- `features.txt`
	- `subject_train.txt`
	- `subject_test.txt`
	- `X_train.txt`
	- `X_test.txt`
	- `y_train.txt`
	- `y_test.txt`

**The R script, run_analysis.R:** Takes the files above and turns them into a clean, tidy data set. This script uses the reshape2 package, so be sure to have that in your environment.

**The Output is a tidy data set file, tidy.csv**

The CodeBook.md file has more on the data and analysis.