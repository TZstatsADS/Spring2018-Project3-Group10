# Project: Dogs, Fried Chicken or Blueberry Muffins?
![image](figs/chicken.jpg)
![image](figs/muffin.jpg)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2018

+ Team 10
+ Team members
	+ Xinlei Cao
	+ Wenyuan Gu
	+ Wenshan Wang
	+ Yiyi Zhang

+ Project summary: In this project, we have created a classification engine for images of poodles, fried chicken and blueberry muffins. Our goal is to improve the prediction accuracy from the baseline model (GBM with decision stumps on 2000 SIFT features) and to enhance computational efficiency in terms of running time, storage and memory cost. We have examined feature descriptors such as cale-invariant feature transform (SIFT), histogram of oriented gradients (HOG), and local binary pattern (LBP), and evaluated classifiers including Gradient Boosting Machine (GBM), RBF Support Vector Machine (SVM), Random Forest (RF), XGBoost, Logistic Regression, Convolutional Neural Network (CNN). Logistic Regression with LBP is finally selected as our improved model, which increases the testing accuracy by 9.5% from 67.3% to 76.8%, and significantly decreases the training time from 403.53s to 0.33s. 
	
**Contribution statement**: 
+ Wenshan Wang: Established and tuned GBM, XGBoost, and SVM model using SIFT, LBP, HOG features, respectively. Compared training time and accuracy of all models using LBP and HOG features. Wrote main.Rmd file. 
+ Yiyi Zhang: Provided general direction on how to proceed the project. Extracted features using SIFT, HOG, and LBP and completed the feature extraction and project summary part of the main.Rmd. Updated README.md. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
