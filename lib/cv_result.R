cv_result <- function(){
  ### gbm model
  model_values <- seq(3, 11, 2) # depth for GBM
  model_labels = paste("depth =", model_values)
  
  load("../output/cv_error/err_cv_HOG_gbm.RData")
  hog_gbm <- err_cv[,1]
  
  load("../output/cv_error/err_cv_LBP_gbm.RData")
  lbp_gbm <- err_cv[,1]
  
  load("../output/cv_error/err_cv_sift_gbm.RData")
  sift_gbm <- err_cv[,1]
  
  cv_gbm <- rbind(hog_gbm, rbind(lbp_gbm, sift_gbm))
  colnames(cv_gbm) <- model_labels
  cv_gbm <- as.data.frame(cv_gbm)
  
  ### XGBoost model
  load("../output/cv_error/err_cv_hog_xg.RData")
  hog_cv <- err_cv[,1]
  load("../output/cv_error/err_cv_lbp_xg.RData")
  lbp_cv <- err_cv[,1]
  load("../output/cv_error/err_cv_sift_xg.RData")
  sift_cv <- err_cv[,1]
  
  err_cv_xg <- rbind(hog_cv,lbp_cv,sift_cv)
  err_cv_xg <- as.data.frame(err_cv_xg)
  
  rownames(err_cv_xg) <- c("hog_xgboost","lbp_xgboost","sift_xgboost")                         
  colnames(err_cv_xg) <- c(paste0("eta = ",seq(0.1,0.5,by = 0.1)))
  
  
  ### SVM model
  load("../output/cv_error/err_cv_HOG_svm.RData")
  hog_cv <- err_cv[,1]
  load("../output/cv_error/err_cv_LBP_svm.RData")
  lbp_cv <- err_cv[,1]
  load("../output/cv_error/err_cv_sift_svm.RData")
  sift_cv <- err_cv[,1]
  
  err_cv_svm <- rbind(hog_cv,lbp_cv,sift_cv)
  err_cv_svm <- as.data.frame(err_cv_svm)
  
  rownames(err_cv_svm) <- c("hog_svm","lbp_svm","sift_svm")                         
  colnames(err_cv_svm) <- c("gamma = 0.01","gamma = 0.03","gamma = 0.05","gamma = 0.07","gamma = 0.09")

  ## random forest
  load("../output/cv_error/err_cv_lbp_RF.RData")
  err_cv_lbp <- cv.error
  load("../output/cv_error/err_cv_HOG_RF.RData")
  err_cv_hog <- cv.error
  
  err_cv_hog <- as.data.frame(err_cv_hog)
  err_cv_lbp <- as.data.frame(err_cv_lbp)
  
  colnames(err_cv_hog) <- c("ntree = 1000","ntree = 1500","ntree = 2000","ntree = 2500")
  rownames(err_cv_hog) <- c(paste0("mtry = ",5:15))
  
  colnames(err_cv_lbp) <- c("ntree = 1000","ntree = 1500","ntree = 2000","ntree = 2500")
  rownames(err_cv_lbp) <- c(paste0("mtry = ",5:15))
  
  err_cv_hog
  err_cv_lbp
  
  
  return(list(cv_gbm, err_cv_xg, cv_svm = err_cv_svm, err_cv_hog, err_cv_lbp))
  
}

