The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R file run_analysis.R performans the following task:

1. Merges the training and test sets to create one data set, rbind the subject_train.txt and subject_test.txt, rbind the Y_train.txt and Y_test.txt, then merge

2. Read features.txt and extracts only the measurements on the mean and standard deviation for each measurement

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying

4.Use gsub function for pattern replacement to clean up the data labels.

5. A clean data set that produce only a data set with the average of each veriable for each activity and subject

  id activity tBodyAcc.std...X_mean tBodyAcc.std...Y_mean tBodyAcc.std...Z_mean
1  1        1           -0.28374026           0.114461337           -0.26002790
2  1        2           -0.35470803          -0.002320265           -0.01947924
3  1        3            0.03003534          -0.031935943           -0.23043421
4  1        4           -0.97722901          -0.922618642           -0.93958629
5  1        5           -0.99575990          -0.973190056           -0.97977588
6  1        6           -0.92805647          -0.836827406           -0.82606140

