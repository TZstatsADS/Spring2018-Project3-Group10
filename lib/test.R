<<<<<<< HEAD
######################################################
### Fit the classification model with testing data ###
######################################################

### Author: Group 10
### Project 3
### ADS Spring 2018

test <- function(fit_train, dat_test, params = NULL,
                 test.gbm = F, test.svm = F, test.xgboost = F,test.log = F,test.rf = F){
  
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
  
  if(test.svm){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  if(test.xgboost) {
    pred <- predict(fit_train, newdata = dat_test)
    pred <- pred + 1
  }
  
  if(test.log){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  if(test.rf){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  return(pred)
}

=======
######################################################
### Fit the classification model with testing data ###
######################################################

### Author: Group 10
### Project 3
### ADS Spring 2018

test <- function(fit_train, dat_test, params = NULL,
                 test.gbm = F, test.svm = F, test.xgboost = F,test.log = F,test.rf = F){
  
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
  
  if(test.svm){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  if(test.xgboost) {
    pred <- predict(fit_train, newdata = dat_test)
    pred <- pred + 1
  }
  
  if(test.log){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  if(test.rf){
    pred <- predict(fit_train, newdata = dat_test)
  }
  
  return(pred)
}

>>>>>>> 0d75e935be2c746b7429d024f6bef09ffa797b68
