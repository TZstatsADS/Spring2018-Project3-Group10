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
cv.gbm = T
K = 5
model_values <- seq(3, 11, 2) # depth for GBM
model_labels = paste("GBM with depth =", model_values)

#
if(run.cv){
  if(cv.gbm){
    err_cv <- array(dim=c(length(model_values), 2))
    for(k in 1:length(model_values)){
      cat("k=", k, "\n")
      err_cv[k,] <- cv.function(as.data.frame(dat_train), label_train, model_values[k], K, cv.gbm = T)
    }
  }

  save(err_cv, file="../output/err_cv_sift_gbm.RData")
}