########################
### Cross Validation ###
########################

### Author: Group 10
### Project 3
### ADS Spring 2018


cv.function <- function(X.train, y.train, d, K,
                        cv,gbm = F){
  
  
  ### Debug
  dat_train <- read.csv('../data/sift_train.csv',header = F)
  dat_train <- dat_train[, -1]
  label_train <- read.csv('../data/label_train.csv', header = T)
  X.train <- as.data.frame(dat_train)
  y.train <- label_train
  d = 3
  K = 5
  i = 1

  y.train <- y.train[,3]
  n <- length(y.train)
  n.fold <- floor(n/K)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data <- X.train[s != i,]
    train.label <- y.train[s != i]
    test.data <- X.train[s == i,]
    test.label <- y.train[s == i]
    print('train.data:')
    print(dim(train.data))
    print(typeof(train.data))
    print(typeof(test.data))
        
    if(cv.gbm){
      params<-list(depth=d)
      print("begin to fit")
      fit <- train(train.data, train.label, params, run.gbm = TRUE)
      print(fit)
      fit$fit
      pred <- test(fit, test.data, test.gbm = T)
    }
    
    cv.error[i] <- mean(pred != y.train[s == i,3])  
    
  }			
  return(c(mean(cv.error),sd(cv.error)))
  
}
