---
title: "Getting and Cleaning Data Course Project CodeBook"
author: "G. Nevado"
date: "23 de julio de 2015"
output: html_document
---

## Getting and Cleaning Data Course Project CodeBook

This document describes the data set generated in the project of Getting and Cleaning Data Course. The data set has been generated after processing original data from UCI HAR DATASET, tha can be downloaded from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

In this original data set, observations are related to the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Transformations to this original data set have been done and are described, including RT code, in the file Readme.md in this GITHUB repo.

## Data set

### Variables and observations
Number of observations: 30
Number of variables: 68

* Variable 'subject' correspond to the subjects.
* Variable 'activity' correspond to the 6 different activities: "walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying".
* 66 variables correspond to measurement of 66 different features, normalized in [-1,1]. All features are transformations of the ones in original data set, by calculating mean or estandar deviation to the original feauture, calculated by subject and activity (see Readme.md in this repo). 

(detailed information of features can be found in the file feature_info.txt of the original data set).

"time_bodyacceleration_mean_X"                            
"time_bodyacceleration_mean_Y"                            
"time_bodyacceleration_mean_Z"                            
"time_bodyacceleration_stddeviation_X"                    
"time_bodyacceleration_stddeviation_Y"                    
"time_bodyacceleration_stddeviation_Z"                    
"time_Gravityacceleration_mean_X"                         
"time_Gravityacceleration_mean_Y"                         
"time_Gravityacceleration_mean_Z"                         
"time_Gravityacceleration_stddeviation_X"                 
"time_Gravityacceleration_stddeviation_Y"                 
"time_Gravityacceleration_stddeviation_Z"                 
"time_bodyaccelerationjerk_mean_X"                        
"time_bodyaccelerationjerk_mean_Y"                        
"time_bodyaccelerationjerk_mean_Z"                        
"time_bodyaccelerationjerk_stddeviation_X"                
"time_bodyaccelerationjerk_stddeviation_Y"                
"time_bodyaccelerationjerk_stddeviation_Z"                
"time_bodygyro_mean_X"                                    
"time_bodygyro_mean_Y"                                    
"time_bodygyro_mean_Z"                                    
"time_bodygyro_stddeviation_X"                            
"time_bodygyro_stddeviation_Y"                            
"time_bodygyro_stddeviation_Z"                            
"time_bodygyrojerk_mean_X"                                
"time_bodygyrojerk_mean_Y"                                
"time_bodygyrojerk_mean_Z"                                
"time_bodygyrojerk_stddeviation_X"                        
"time_bodygyrojerk_stddeviation_Y"                        
"time_bodygyrojerk_stddeviation_Z"                        
"time_bodyaccelerationmagnitude_mean"                     
"time_bodyaccelerationmagnitude_stddeviation"             
"time_Gravityaccelerationmagnitude_mean"                  
"time_Gravityaccelerationmagnitude_stddeviation"          
"time_bodyaccelerationjerkmagnitude_mean"                 
"time_bodyaccelerationjerkmagnitude_stddeviation"         
"time_bodygyromagnitude_mean"                             
"time_bodygyromagnitude_stddeviation"                     
"time_bodygyrojerkmagnitude_mean"                         
"time_bodygyrojerkmagnitude_stddeviation"                 
"frequency_bodyacceleration_mean_X"                       
"frequency_bodyacceleration_mean_Y"                       
"frequency_bodyacceleration_mean_Z"                       
"frequency_bodyacceleration_stddeviation_X"               
"frequency_bodyacceleration_stddeviation_Y"               
"frequency_bodyacceleration_stddeviation_Z"               
"frequency_bodyaccelerationjerk_mean_X"                   
"frequency_bodyaccelerationjerk_mean_Y"                   
"frequency_bodyaccelerationjerk_mean_Z"                   
"frequency_bodyaccelerationjerk_stddeviation_X"           
"frequency_bodyaccelerationjerk_stddeviation_Y"           
"frequency_bodyaccelerationjerk_stddeviation_Z"           
"frequency_bodygyro_mean_X"                               
"frequency_bodygyro_mean_Y"                               
"frequency_bodygyro_mean_Z"                               
"frequency_bodygyro_stddeviation_X"                       
"frequency_bodygyro_stddeviation_Y"                       
"frequency_bodygyro_stddeviation_Z"                       
"frequency_bodyaccelerationmagnitude_mean"                
"frequency_bodyaccelerationmagnitude_stddeviation"        
"frequency_bodybodyaccelerationjerkmagnitude_mean"        
"frequency_bodybodyaccelerationjerkmagnitude_stddeviation"
"frequency_bodybodygyromagnitude_mean"                    
"frequency_bodybodygyromagnitude_stddeviation"            
"frequency_bodybodygyrojerkmagnitude_mean"                
"frequency_bodybodygyrojerkmagnitude_stddeviation"    


