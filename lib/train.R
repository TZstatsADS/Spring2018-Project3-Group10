#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Group 10
### Project 3
### ADS Spring 2018


train.gbm <- function(dat_train, label_train, params=NULL,
                  run.gbm = F){
  
  ### Train a Gradient Boosting Model (GBM) using processed features from training images
  
  ### Input: 
  ###  -  processed features from images 
  ###  -  class labels for training images
  ### Output: training model specification
  
  ## GBM model
  gbm <- NULL
  if (run.gbm){
    if(!require("gbm")){
      install.packages("gbm")
    }
    library("gbm")
    gbm.fit <- gbm.fit(x = dat_train, 
                       y = label_train,
                       n.trees = 400,
                       distribution = "multinomial",
                       interaction.depth = params,
                       shrinkage = 0.2,
                       n.minobsinnode = 30,
                       verbose = F)
    best_ntrees <- gbm.perf(gbm.fit,method = "OOB",plot.it = FALSE)
    
    return(list(fit = gbm.fit,best_n.trees = best_ntrees))
  }
  
  
  ## SVM model
  svm <- NULL
  if(run.svm){
    if( !require("e1071" )){
      installed.packages("e1071")
    }
    library("e1071")
    
    svm.fit <- svm(dat_train, label_train[,3], type = "C", kernel = "radial", gamma = params)
    
    return(list(svm = svm.fit))
  }
  
}
