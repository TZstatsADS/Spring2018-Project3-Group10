#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Group 10
### Project 3
### ADS Spring 2018


train <- function(dat_train, label_train, params=NULL,
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
                       y = label_train[,3],
                       n.trees = 400,
                       distribution = "multinomial",
                       interaction.depth = params,
                       shrinkage = 0.2,
                       n.minobsinnode = 30,
                       verbose = F)
    return(gbm.fit)
  }
  
}
