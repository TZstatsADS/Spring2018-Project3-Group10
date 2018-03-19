setwd("~/GitHub/Spring2018-Project3-spring2018-project3-group10/doc")
getwd()

# read train dataset
dat <- read.csv('../output/feature_LBP.csv',header = F)
label <- read.csv('../data/label_train.csv')
label <- label[,3]

dat <- cbind(label,dat)
dim(dat)
dat <- as.data.frame(dat)


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
save(error.mean, file="../output/err_lbp_log.RData")