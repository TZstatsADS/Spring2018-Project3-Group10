run.sift = T

label_train <- read.csv('../output/sift_train.csv', header = T)
label_train <- label_train[,2]

if(run.sift){
  dat_test <- read.csv('../output/sift_test.csv',header = T)
  dat_test <- dat_test[,-1]
}