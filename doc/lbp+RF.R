install.packages('randomForest')
library(randomForest, lib.loc = "C:\\Users\\Administrator\\AppData\\Local\\Temp\\RtmpgN0kEC\\downloaded_packages" )
install.packages('caret')
install.packages('e1071')
library(caret, lib.loc = "C:\\Users\\Administrator\\AppData\\Local\\Temp\\RtmpgN0kEC\\downloaded_packages")
library(e1071, lib.loc = "C:\\Users\\Administrator\\AppData\\Local\\Temp\\RtmpgN0kEC\\downloaded_packages")

##
setwd("~/GitHub/Spring2018-Project3-spring2018-project3-group10/doc")
lbp <- read.csv('../output/feature_LBP.csv',header = F)
dim(lbp)

features <- lbp
labels_set <- read.csv('../data/label_train.csv')
labels <- labels_set[,3]
dataset <- cbind(labels,features)
dim(dataset)
colnames(dataset)

#--------------Caret Package for Tuning Parameters-------------
#----------------Two Parameters: mtry & ntree------------------

customRF <- list(type = "Classification", library = "randomForest", loop = NULL)
customRF$parameters <- data.frame(parameter = c("mtry", "ntree"), class = rep("numeric", 2), label = c("mtry", "ntree"))
customRF$grid <- function(x, y, len = NULL, search = "grid") {}
customRF$fit <- function(x, y, wts, param, lev, last, weights, classProbs, ...) {
  randomForest(x, y, mtry = param$mtry, ntree=param$ntree, ...)
}
customRF$predict <- function(modelFit, newdata, preProc = NULL, submodels = NULL)
  predict(modelFit, newdata)
customRF$prob <- function(modelFit, newdata, preProc = NULL, submodels = NULL)
  predict(modelFit, newdata, type = "prob")
customRF$sort <- function(x) x[order(x[,1]),]
customRF$levels <- function(x) x$classes

control <- trainControl(method="repeatedcv", number=5, repeats=2) # 5-fold cross validation and 2 repeats
tunegrid <- expand.grid(.mtry=c(5:15), .ntree=c(1000, 1500, 2000, 2500))
set.seed(123)
custom <- train(as.factor(labels)~., data=dataset, method=customRF, tuneGrid=tunegrid, trControl=control)
summary(custom)
plot(custom)

##
save(custom,'../output/lbp+RF.RData')
