setwd("~/Spring2018-Project3-Group10/doc")
sift_train <- read.csv("../data/SIFT_train.csv", header = F)
class(sift_train)
dim(sift_train)

source("../lib/train_test_split.R")

df = train_test_split("sift") 
Sift_train = df$df_train[,-1]
Sift_test = df$df_test[,-1]

#1.2
source("../lib/train1.R")
source("../lib/test1.R")

baseline.result = train_gbm(Sift_train)

library(caret)

fitControl <- trainControl(method = "cv", number = 2,returnResamp = "all")
model2 <- train(label~., data=Sift_train,method='gbm',distribution='multinomial',trControl = fitControl,verbose=F,tuneGrid = data.frame(n.trees=1:10,shrinkage=rep(0.1,10),interaction.depth=1:10,n.minobsinnode=rep(20,10)))
model2


save(baseline.result,file = "../output/baseline.result.Rdata")

load("../output/baseline.result.Rdata")

baseline.time = baseline.result[[2]]
baseline.time

baseline.accuracy = 1 - baseline.result$fit[[3]]
print(paste0("The accuracy rate of baseline model is ", baseline.accuracy))

model3 <- train_svm(Sift_train)
#1.3
df2 = train_test_split("lbp") 

