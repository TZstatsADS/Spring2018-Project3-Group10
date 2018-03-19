# install.packages("caret")
library(caret)

split_train_test <- function(features){
  label_train <- read.csv('../data/label_train.csv', header = T)
  label_train <- label_train[,3]
  
  dat_all <- cbind(label_train, features)
  dat_all <- as.data.frame(dat_all)
  dat_all$label_train <- as.factor(dat_all$label_train)
  set.seed(123)
  test.index <- createDataPartition(dat_all$label_train, p = 0.2, list = F) # balanced partition
  
  test <- dat_all[test.index, ]
  train <- dat_all[-test.index,]
  
  return(list(train = train, test = test))
}
