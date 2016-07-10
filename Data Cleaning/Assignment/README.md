# Final project - Coursera: Getting and Cleaning Data 

## Introduction
The repository contains my solution for the final project for the Coursera course "Getting and Cleaning data"

## Original data
The original data can be downloade from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
More details of how the original data is structures is found in the README file found within the zip file together with the data.

## Script and output
run_analysis.R will download the datafile and extract it folder "UCI HAR Dataset". It will then merge the test and training sets together. Extract only mean and standard diviation measurements, fix the variable names to be meaningful.  Lastly the script will generate a special tidy dataset where the mean of all measuresments for activities and subjects and export that to a file called: tidy_means.txt

## CodeBook 
Details for data transformation and variables can be found in the codebook.
