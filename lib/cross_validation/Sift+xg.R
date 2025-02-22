setwd("~/GitHub/Spring2018-Project3-spring2018-project3-group10/doc")
getwd()

# read train dataset
dat_train <- read.csv('../data/SIFT_train.csv', header = F)
label_train <- read.csv('../data/label_train.csv')
dat_train <- dat_train[, -1]
label_train <- label_train[,3]

#
source("../lib/train.R")
source("../lib/test.R")
source("../lib/cross_validation.R")

# which model to perform cross validation
run.cv = T
cv.xgboost = T
K = 5
xgboost_values <- seq(0.1, 0.5, by = 0.1) # eta for xgboost
xgboost_labels = paste("XGBoost with eta =", xgboost_values)

#
k=5
if(run.cv){
  if(cv.xgboost){
    err_cv <- array(dim=c(length(xgboost_values), 2))
    for(k in 1:length(xgboost_values)){
      cat("k=", k, "\n")
      err_cv[k,] <- cv.function(as.data.frame(dat_train), label_train, xgboost_values[k], K, cv.xgboost = T)
    }
  }
  
  save(err_cv, file="../output/err_cv_sift_xg.RData")
}