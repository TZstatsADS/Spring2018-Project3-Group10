setwd("~/GitHub/Spring2018-Project3-spring2018-project3-group10/doc")
getwd()

# read train dataset
load('../output/feature_HOG.RData')
label <- read.csv('../data/label_train.csv')
dat <- hog
label <- label[,3]

dat <- cbind(label,dat)
dim(dat)
dat <- as.data.frame(dat)

#
source("../lib/train.R")
source("../lib/test.R")
source("../lib/cross_validation.R")



##### Logistic Regression #####

train_log = function(dat_train){
  
  ###  dat_train: processed features from images also contains label
  
  library(nnet)
  
  log.fit = multinom(label~., 
                     data = dat_train, 
                     MaxNWts=16000)
  
  return(fit = log.fit)
}

test = function(fit_train, dat_test){
  pred = predict(fit_train, newdata = dat_test)
  return(pred)
}

#
K <- 5
n <- length(label)
n.fold <- floor(n/K)
s <- sample(rep(1:K, each = n.fold)) 
error <- rep(NA, K)

for (i in 1:K){
  train.data <- dat[s != i,]
  test.data <- dat[s == i,]
  print('train.data:')
  print(dim(train.data))
  
  test.data <- as.matrix(test.data)
  
  fit <- train_log(train.data)
  pred <- test(fit,test.data[,-1])
  
  error[i] <- mean(pred != label[s == i])
}

error.mean <- mean(error)
save(error.mean, file="../output/err_HOG_log.RData")