# CodeBook

## Original dataset downloade from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformations
1. Training and Test data are loaded into 3 dataframes each: measurements, activity and subject
2. Training and Test datasets are merged into 3 dataframes
3. Only measurements on the mean and standard deviation are kept in the measurements dataframe
4. The 3 dataframes are merged into a single large dataframe
5. The final tidy dataset can be found in variable: df_complete
6. A special independent dataset is created to contain the mean value of each measurement for all activities for all subjects. The dataset can be found in variable: df_mean and has been exported as tidy_means.txt

## Key variables:
Activity and Subject are key variables identifying what activity the subject were duing for the measurement values in the remaining variables found in the dataset.
* Activity
* Subject

## Measurements variables:
All measurements are normalized to values between [-1,1]
* TimeBodyAccMeanX                      
* TimeBodyAccMeanY                      
* TimeBodyAccMeanZ                   
* TimeBodyAccStdDevX                    
* TimeBodyAccStdDevY                    
* TimeBodyAccStdDevZ                   
* TimeGravityAccMeanX                   
* TimeGravityAccMeanY                   
* TimeGravityAccMeanZ                  
* TimeGravityAccStdDevX                 
* TimeGravityAccStdDevY                 
* TimeGravityAccStdDevZ                 
* TimeBodyAccJerkMeanX                  
* TimeBodyAccJerkMeanY                  
* TimeBodyAccJerkMeanZ                  
* TimeBodyAccJerkStdDevX                
* TimeBodyAccJerkStdDevY                
* TimeBodyAccJerkStdDevZ                
* TimeBodyGyroMeanX                     
* TimeBodyGyroMeanY                     
* TimeBodyGyroMeanZ                    
* TimeBodyGyroStdDevX                   
* TimeBodyGyroStdDevY                   
* TimeBodyGyroStdDevZ                  
* TimeBodyGyroJerkMeanX                 
* TimeBodyGyroJerkMeanY                 
* TimeBodyGyroJerkMeanZ                
* TimeBodyGyroJerkStdDevX               
* TimeBodyGyroJerkStdDevY               
* TimeBodyGyroJerkStdDevZ               
* TimeBodyAccMagMean                   
* TimeBodyAccMagStdDev                  
* TimeGravityAccMagMean                
* TimeGravityAccMagStdDev               
* TimeBodyAccJerkMagMean               
* TimeBodyAccJerkMagStdDev              
* TimeBodyGyroMagMean                  
* TimeBodyGyroMagStdDev                
* TimeBodyGyroJerkMagMean              
* TimeBodyGyroJerkMagStdDev             
* FrequencyBodyAccMeanX                 
* FrequencyBodyAccMeanY                 
* FrequencyBodyAccMeanZ                
* FrequencyBodyAccStdDevX               
* FrequencyBodyAccStdDevY               
* FrequencyBodyAccStdDevZ            
* FrequencyBodyAccmeanFreqX           
* FrequencyBodyAccmeanFreqY           
* FrequencyBodyAccmeanFreqZ           
* FrequencyBodyAccJerkMeanX             
* FrequencyBodyAccJerkMeanY             
* FrequencyBodyAccJerkMeanZ            
* FrequencyBodyAccJerkStdDevX
* FrequencyBodyAccJerkStdDevY           
* FrequencyBodyAccJerkStdDevZ        
* FrequencyBodyAccJerkmeanFreqX       
* FrequencyBodyAccJerkmeanFreqY       
* FrequencyBodyAccJerkmeanFreqZ
* FrequencyBodyGyroMeanX                
* FrequencyBodyGyroMeanY                
* FrequencyBodyGyroMeanZ               
* FrequencyBodyGyroStdDevX              
* FrequencyBodyGyroStdDevY              
* FrequencyBodyGyroStdDevZ           
* FrequencyBodyGyromeanFreqX          
* FrequencyBodyGyromeanFreqY          
* FrequencyBodyGyromeanFreqZ         
* FrequencyBodyAccMagMean              
* FrequencyBodyAccMagStdDev          
* FrequencyBodyAccMagmeanFreq        
* FrequencyBodyBodyAccJerkMagMean      
* FrequencyBodyBodyAccJerkMagStdDev  
* FrequencyBodyBodyAccJerkMagmeanFreq
* FrequencyBodyBodyGyroMagMean         
* FrequencyBodyBodyGyroMagStdDev       
* FrequencyBodyBodyGyroMagmeanFreq    
* FrequencyBodyBodyGyroJerkMagMean    
* FrequencyBodyBodyGyroJerkMagStdDev 
* FrequencyBodyBodyGyroJerkMagmeanFreq

