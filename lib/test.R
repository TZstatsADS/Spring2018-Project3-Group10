######################################################
### Fit the classification model with testing data ###
######################################################

### Author: Group 10
### Project 3
### ADS Spring 2018

test.gbm <- function(fit_train, dat_test, params = NULL,
                 test.gbm = F){
  
  ### Fit the classfication model with testing data
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  -  processed features from testing images 
  ### Output: training model specification
  
  ### load libraries
  library("gbm")
  
  if( test.gbm ){
    prob.pred <- predict(fit_train$fit, 
                         n.trees = fit_train$best_n.trees,
                         newdata=dat_test, 
                         type="response")
    pred<- apply(prob.pred, 1, which.max) 
  } 
}

