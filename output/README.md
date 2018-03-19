# Project: Dogs, Fried Chicken or Blueberry Muffins? 
### Output folder

The output directory contains analysis output, processed datasets, logs, or other processed things.

+ **Feature Extraction**  
  + [`feature_SIFT.RData`](feature_SIFT.RData): contains processed features for the images using SIFT method. 
    + [`sift_train.csv`](sift_train.csv): training set 
    + [`sift_test.csv`](sift_test.csv): test set 
  + [`feature_HOG.RData`](feature_HOG.RData): contains processed features for the images using HOG method.  
    + [`hot_train.csv`](hot_train.csv): training set  
    + [`hog_test.csv`](hog_test.csv): test set 
  + [`feature_LBP.mat`](feature_LBP.mat)/[`feature_LBP.csv`](feature_LBP.csv): contain processed features for the images using LBP method. 
    + [`lbp_train.csv`](lbp_train.csv): training set
    + [`lbp_test.csv`](lbp_test.csv): test set  
+ **Classification Model**  
  + [`err_cv.RData`](err_cv.RData):  

