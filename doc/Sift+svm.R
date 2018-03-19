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
cv.svm = T
K = 5
svm_values <- seq(0.01, 0.1, by = 0.02) # gamma for svm
svm_labels = paste("SVM with gamma =", svm_values)

#
if(cv.svm){
  err_cv <- array(dim=c(length(svm_values), 2))
  for(k in 1:length(svm_values)){
    cat("k=", k, "\n")
    err_cv[k,] <- cv.function(as.data.frame(dat_train), label_train, svm_values[k], K, cv.svm = T)
  }
}
save(err_cv, file="../output/err_cv_sift_svm.RData")
