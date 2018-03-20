#
library(randomForest)
library(caret)
library(e1071)

setwd("~/GitHub/Spring2018-Project3-spring2018-project3-group10/doc")
getwd()


#
load('../output/feature_HOG.RData')
features <- hog
labels_set <- read.csv('../data/label_train.csv')
labels <- labels_set[,3]
dataset <- cbind(labels,features)
dim(dataset)

#
mtry.range=c(5:15)
ntree.range=c(1000, 1500, 2000, 2500)

cv.error <- matrix(NA,ncol = 4,nrow = 11)
rownames(cv.error) <- mtry.range
colnames(cv.error) <- ntree.range

for (i in 1:11){
  for (j in 1:4){
    
    error <- rep(NA,5)
    
    for (k in 1:5){
      
      n <- length(labels)
      n.fold <- floor(n/5)
      s <- sample(rep(1:5, each = n.fold)) 
      
      train <- dataset[s != k,]
      test <- dataset[s == k,]
      train_labels <- train[,1]
      train_features <- train[,2:ncol(train)]
      test_labels <- test[,1]
      test_features <- test[,2:ncol(test)]
      
      fit <- randomForest(as.factor(train_labels) ~ .,
                          data = train_features, mtry = mtry.range[i],
                          importance=TRUE, 
                          ntree=ntree.range[j])
      
      Prediction <- predict(fit, test_features)
      Accuracy <- sum(Prediction == test_labels)/length(test_labels)
      error[k] <- 1 - Accuracy
    }
    print(error)
    
    cv.error[i,j] <- mean(error)
  }
}

save(cv.error, file="../output/err_cv_HOG_RF.RData")
