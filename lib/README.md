# Project: Dogs, Fried Chicken or Blueberry Muffins? 

### Code lib Folder

The lib directory contains various files with function definitions and code.

+ **Feature Extraction**  
    + [`feature.R`](feature.R): contain processed features for the images using SIFT, HOG, and LBP methods.    
    + [`feature.m`](feature.m): output .mat and .csv files that contain processed features for the images using LBP method.  
+ **Classification Model**  
    + [`split_train_test.R`](split_train_test.R): split images into training and test sets.     
    + [`cross_validation.R`](cross_validation.R): perform cross validation.    
    + [`train.R`](train.R): fit the models using the training set.   
    + [`test.R`](test.R): predict test set using the trained models.   
