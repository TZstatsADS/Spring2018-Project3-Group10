# install.packages("caret")
library(caret)



split_train_test <- function(feature_name){
  if("sift1" %in% feature_name){
    dat_train = read.csv('../data/SIFT_train.csv',header = F)
    dat_train = dat_train[,-1]
  }

  if("hog" %in% feature_name){
    load("../output/feature_HOG.RData")
    dat_train <- hog
  }

  if ("lbp" %in% feature_name){
    dat_train = read.csv('../output/feature_LBP.csv',header = F)
  }
  
  if ("resize_sift" %in% feature_name){
    load("../output/feature_SIFT.RData")
    dat_train <- sift
  }
  
  label_train <- read.csv('../data/label_train.csv', header = T)
  label_train <- label_train[,3]
  
  dat_all <- cbind(label_train, dat_train)
  dat_all <- as.data.frame(dat_all)
  dat_all$label_train <- as.factor(dat_all$label_train)
  set.seed(123)
  test.index <- createDataPartition(dat_all$label_train, p = 0.2, list = F) # balanced partition
  
  test <- dat_all[test.index, ]
  train <- dat_all[-test.index,]
  
  return(list(train = train, test = test))
  
}

## split sift feature
data <- split_train_test("sift1")
write.csv(data$train, "sift_train.csv")
write.csv(data$test, "sift_test.csv")

## split hog feature
data <- split_train_test("hog")
write.csv(data$train, "hog_train.csv")
write.csv(data$test, "hog_test.csv")

## split lbp feature
data <- split_train_test("lbp")
write.csv(data$train, "lbp_train.csv")
write.csv(data$test, "lbp_test.csv")

# load("../output/feature_SIFT.RData")
# dim(sift)

## split resized sift feature
data <- split_train_test("resize_sift")
write.csv(data$train, "resize_sift_train.csv")
write.csv(data$test, "resize_sift_test.csv")


