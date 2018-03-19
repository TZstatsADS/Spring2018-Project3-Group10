# Project: Dogs, Fried Chicken or Blueberry Muffins? 

### Code lib Folder

The lib directory contains various files with function definitions and code.

+ **Feature Extraction**  
    + `feature.R`: output .RDATA files that contain processed features for the images using SIFT and HOG methods.    
    + `feature.m`: output .mat and .csv files that contrain processed features for the images using LBP method.  
+ **Classification Model**  
    + `split_train_test.R`: split images into train set and test set.     
    + `cross_validation.R`: perform cross validation.    
    + `train.R`: fit the models using train set.   
    + `test.R`: predict test set using trained models.   
