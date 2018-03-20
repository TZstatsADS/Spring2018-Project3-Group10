#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Group 10
### Project 3
### ADS Spring 2018


train <- function(dat_train, label_train, params=NULL,
                  run.gbm = F, run.svm = F, run.xgboost = F,run.log = F,run.rf = F){
  
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
      install.packages("e1071")
    }
    library("e1071")
    
    svm.fit <- svm(dat_train, label_train, 
                   type = "C", kernel = "radial", gamma = params)
    
    # type = "C", kernel = "radial", 
    return(svm = svm.fit)
  }
  
  
  ## xgboost model
  xgboost <- NULL
  if(run.xgboost){
    if( !require("xgboost" )){
      install.packages("xgboost")
    }
    library("xgboost")
    dtrain=xgb.DMatrix(data=dat_train,label=label_train)
    param <- list("objective" = "multi:softmax",
                  "eval_metric" = "mlogloss",
                  "num_class" = 3, 'eta' = params, 'max_depth' = 6,
                  "nthread" = 2, "colsample_bytre" = 0.5, "min_child_weight" = 2,
                  "subsample" = 0.7, "gamma" = 0.02)
    xgboost.fit <- xgb.train(data = dtrain,  param = param, nrounds = 1000)
    return(xgboost.fit)
    
  }
  
  ## logistic regression
  log <- NULL
  if(run.log){
    if( !require("nnet")){
      install.packages("nnet")
    }
    library("nnet")

    dat_train_complete <- cbind(label_train,dat_train)
    log.fit = multinom(label~., 
                       data = dat_train_complete, 
                       MaxNWts=16000)
    
    return(fit = log.fit)
  }
  
  ## random forest
  rf <- NULL
  if(run.rf){
    library(randomForest)
    library(caret)
    library(e1071)
    
    rf.fit <- randomForest(as.factor(label_train) ~ .,
                        data = dat_train, mtry = params[1],
                        importance=TRUE, 
                        ntree = param[2])
    return(fit = rf.fit)
  }
  
}
