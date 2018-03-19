########################
### Cross Validation ###
########################

### Author: Group 10
### Project 3
### ADS Spring 2018

cv.function <- function(X.train, y.train, d, K,
                        cv.gbm = F, cv.svm = F, cv.xgboost = F){

  ########
  
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
      fit <- train(train.data, train.label, params, run.gbm = T)
      print(fit) # for debug
      pred <- test(fit, test.data, test.gbm = T)
    }
    
    if(cv.svm){
      params <- list(cost=d)
      fit <- train(train.data, train.label, params, run.svm = TRUE)
      pred <- test(fit, test.data, test.svm = T)
    }
    
    if(cv.xgboost){
      params <- d
      train.data <- as.matrix(train.data)
      train.label <- train.label - 1
      fit <- train(train.data, train.label, params, run.xgboost = TRUE)
      pred <- test(fit, test.data, test.xgboost = T)
    }
    
    cv.error[i] <- mean(pred != y.train[s == i])  
    print(cv.error[i])
    
  }			
  return(c(mean(cv.error),sd(cv.error)))
  
}
