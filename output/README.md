# Project: Dogs, Fried Chicken or Blueberry Muffins? 
### Output folder

The output directory contains analysis output, processed datasets, logs, or other processed things.

+ **Feature Extraction**  
  + [`feature_SIFT.RData`](feature_SIFT.RData): contains processed features for the images using SIFT method. 
    + [`sift_train.csv`](sift_train.csv): training set 
    + [`sift_test.csv`](sift_test.csv): testing set 
  + [`feature_HOG.RData`](feature_HOG.RData): contains processed features for the images using HOG method.  
    + [`hog_train.csv`](hot_train.csv): training set  
    + [`hog_test.csv`](hog_test.csv): testing set 
  + [`feature_LBP.mat`](feature_LBP.mat)/[`feature_LBP.csv`](feature_LBP.csv): contain processed features for the images using LBP method. 
    + [`lbp_train.csv`](lbp_train.csv): training set
    + [`lbp_test.csv`](lbp_test.csv): testing set  
+ **Classification Model**  
  + [`compare_sift.csv`](compare_sift.csv): compares the running time and accuracy of models using SIFT features.
  + [`compare_hog.csv`](compare_hog.csv): compares the running time and accuracy of models using HOG features.
  + [`compare_lbp.csv`](compare_lbp.csv): compares the running time and accuracy of models using LBP features.

