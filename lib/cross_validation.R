########################
### Cross Validation ###
########################

### Author: Group 10
### Project 3
### ADS Spring 2018

cv.function.gbm <- function(X.train, y.train, d, K,
                        gbm = F){
  
  
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

    test.data <- as.matrix(test.data)

    if(cv.gbm){
      params<-list(depth=d)
      print("begin to fit")
      fit <- train.gbm(train.data, train.label, params, run.gbm = TRUE)
      print(fit)
      pred <- test.gbm(fit, test.data, test.gbm = T)
    }
    
    cv.error[i] <- mean(pred != y.train[s == i])  
    
  }			
  return(c(mean(cv.error),sd(cv.error)))
  
}
