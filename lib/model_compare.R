
compare.model <- function(run.compare = F){
  
  if(run.compare){
    
    source("../lib/train.R")
    source("../lib/test.R")
    
    ######  feature hog
    
    # read test dataset
    dat_test <- read.csv("../output/hog_test.csv", header = T)
    dat_test <- dat_test[,-1]
    
    # read train dataset
    dat_train <- read.csv("../output/hog_train.csv", header = T)
    dat_train <- dat_train[, 3:length(dat_train[1,])]
    label_train <- read.csv("../output/hog_train.csv", header = T)
    label_train <- label_train[,2]
    
    dim(dat_train)
    length(label_train)
    
    # fit model
    tm_train <- rep(NA, 5)
    tm_train[1] <- system.time(model.hog.gbm <- train(as.data.frame(dat_train), label_train, 
                                                      params = 7, run.gbm = T))
    tm_train[2] <- system.time(model.hog.svm <- train(as.data.frame(dat_train), label_train, 
                                                      params = 0.03, run.svm = T))
    tm_train[3] <- system.time(model.hog.log <- train(as.data.frame(dat_train), label_train, 
                                                      run.log = T))
    tm_train[4] <- system.time(model.hog.rf <- train(as.data.frame(dat_train), label_train, 
                                                     params = c(6, 2000), run.rf = T))
    tm_train[5] <- system.time(model.hog.xgboost <- train(as.data.frame(dat_train), label_train-1, 
                                                          params = 0.2, run.xgboost = T))
    
    tm_test <- rep(NA, 5)
    error <- rep(NA, 5)
    tm_test[1] <- system.time(pred_gbm <- test(model.hog.gbm, dat_test[,-1], test.gbm = T))
    error[1] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[2] <- system.time(pred_svm <- test(model.hog.svm, dat_test[,-1], test.svm  = T))
    error[2] <- mean(pred_svm != dat_test[,1])  
    
    tm_test[3] <- system.time(pred_log <- test(model.hog.log, dat_test[,-1], test.log = T))
    error[3] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[4] <- system.time(pred_rf <- test(model.hog.rf, dat_test[,-1], test.rf = T))
    error[4] <- mean(pred_log != dat_test[,1])  
    
    tm_test[5] <- system.time(pred_xgboost <- test(model.hog.xgboost, as.matrix(dat_test[,-1]), test.xgboost = T))
    error[5] <- mean(pred_xgboost != dat_test[,1])  
    
    hog.result <- as.data.frame(rbind(tm_train, rbind(tm_test, error)))
    colnames(hog.result) <- c("gbm", "svm", "logistic", "rf", "xgboost")
    
    # write.csv(hog.result, "compare_hog.csv")
    
    
    
    
    
    
    
    ######  feature lbp
    # read test dataset
    dat_test <- read.csv("../output/lbp_test.csv", header = T)
    dat_test <- dat_test[,-1]
    
    # read train dataset
    dat_train <- read.csv("../output/lbp_train.csv", header = T)
    dat_train <- dat_train[, 3:length(dat_train[1,])]
    label_train <- read.csv("../output/lbp_train.csv", header = T)
    label_train <- label_train[,2]
    
    dim(dat_train)
    length(label_train)
    
    # fit model
    tm_train <- rep(NA, 5)
    tm_train[1] <- system.time(model.lbp.gbm <- train(as.data.frame(dat_train), label_train, 
                                                      params = 7, run.gbm = T))
    tm_train[2] <- system.time(model.lbp.svm <- train(as.data.frame(dat_train), label_train, 
                                                      params = 0.03, run.svm = T))
    tm_train[3] <- system.time(model.lbp.log <- train(as.data.frame(dat_train), label_train, 
                                                      run.log = T))
    tm_train[4] <- system.time(model.lbp.rf <- train(as.data.frame(dat_train), label_train, 
                                                     params = c(14, 1500), run.rf = T))
    tm_train[5] <- system.time(model.lbp.xgboost <- train(as.data.frame(dat_train), label_train-1, 
                                                          params = 0.1, run.xgboost = T))
    
    tm_test <- rep(NA, 5)
    error <- rep(NA, 5)
    tm_test[1] <- system.time(pred_gbm <- test(model.lbp.gbm, dat_test[,-1], test.gbm = T))
    error[1] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[2] <- system.time(pred_svm <- test(model.lbp.svm, dat_test[,-1], test.svm  = T))
    error[2] <- mean(pred_svm != dat_test[,1])  
    
    tm_test[3] <- system.time(pred_log <- test(model.lbp.log, dat_test[,-1], test.log = T))
    error[3] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[4] <- system.time(pred_rf <- test(model.lbp.rf, dat_test[,-1], test.rf = T))
    error[4] <- mean(pred_log != dat_test[,1])  
    
    tm_test[5] <- system.time(pred_xgboost <- test(model.lbp.xgboost, as.matrix(dat_test[,-1]), test.xgboost = T))
    error[5] <- mean(pred_xgboost != dat_test[,1])  
    
    lbp.result <- as.data.frame(rbind(tm_train, rbind(tm_test, error)))
    colnames(lbp.result) <- c("gbm", "svm", "logistic", "rf", "xgboost")
    
    # write.csv(lbp.result, "compare_lbp.csv")
    
    
    
    
    
    
    
    
    ###### feature sift
    
    # read test dataset
    dat_test <- read.csv("../output/sift_test.csv", header = T)
    dat_test <- dat_test[,-1]
    
    # read train dataset
    dat_train <- read.csv("../output/sift_train.csv", header = T)
    dat_train <- dat_train[, 3:length(dat_train[1,])]
    label_train <- read.csv("../output/sift_train.csv", header = T)
    label_train <- label_train[,2]
    
    dim(dat_train)
    length(label_train)
    
    # fit model
    tm_train <- rep(NA, 5)
    tm_train[1] <- system.time(model.sift.gbm <- train(as.data.frame(dat_train), label_train, 
                                                       params = 7, run.gbm = T))
    tm_train[2] <- system.time(model.sift.svm <- train(as.data.frame(dat_train), label_train, 
                                                       params = 0.01, run.svm = T))
    tm_train[3] <- system.time(model.sift.log <- train(as.data.frame(dat_train), label_train, 
                                                       run.log = T))
    tm_train[4] <- system.time(model.sift.rf <- train(as.data.frame(dat_train), label_train, 
                                                      params = c(14, 1500), run.rf = T))
    tm_train[5] <- system.time(model.sift.xgboost <- train(as.data.frame(dat_train), label_train-1, 
                                                           params = 0.1, run.xgboost = T))
    
    tm_test <- rep(NA, 5)
    error <- rep(NA, 5)
    tm_test[1] <- system.time(pred_gbm <- test(model.sift.gbm, dat_test[,-1], test.gbm = T))
    error[1] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[2] <- system.time(pred_svm <- test(model.sift.svm, dat_test[,-1], test.svm  = T))
    error[2] <- mean(pred_svm != dat_test[,1])  
    
    tm_test[3] <- system.time(pred_log <- test(model.sift.log, dat_test[,-1], test.log = T))
    error[3] <- mean(pred_gbm != dat_test[,1])  
    
    tm_test[4] <- system.time(pred_rf <- test(model.sift.rf, dat_test[,-1], test.rf = T))
    error[4] <- mean(pred_log != dat_test[,1])  
    
    tm_test[5] <- system.time(pred_xgboost <- test(model.sift.xgboost, as.matrix(dat_test[,-1]), test.xgboost = T))
    error[5] <- mean(pred_xgboost != dat_test[,1])  
    
    sift.result <- as.data.frame(rbind(tm_train, rbind(tm_test, error)))
    colnames(sift.result) <- c("gbm", "svm", "logistic", "rf", "xgboost")
    
    write.csv(sift.result, "../output/compare_sift.csv")
  }
  
  compare_hog <- read.csv("../output/compare_hog.csv", header = T)
  print(compare_hog)
  
  compare_lbp <- read.csv("../output/compare_lbp.csv", header = T)
  print(compare_lbp)
  
  compare_sift <- read.csv("../output/compare_sift.csv", header = T)
  print(compare_sift)
}

