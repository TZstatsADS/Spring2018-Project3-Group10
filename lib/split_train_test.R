install.packages("caret")
library(caret)

split_train_test <- function(feature_name){
  
}

split_train_test_sift <- function(){
  dat_train = read.csv('../data/sift_train.csv',header = F)
  dat_train = dat_train[,-1]
  label_train <- read.csv('../data/label_train.csv', header = T)
  label_train <- label_train[,3]
  
  dat_all <- cbind(label_train, dat_train)
  dat_all$label_train <- as.factor(dat_all$label_train)
  test.index <- createDataPartition(dat_all$label_train, p = 0.2, list = F) # balanced partition
  
  test <- dat_all[test.index, ]
  train <- dat_all[-test.index,]
  
  return(list(train = train, test = test))
  
}

data <- split_train_test_sift()
write.csv(data$train, "sift_train.csv")
write.csv(data$test, "sift_test.csv")
