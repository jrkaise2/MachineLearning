#facial features
#http://archive.ics.uci.edu/ml/datasets/credit+approval

rm(list=ls())
# d <- read.csv('C:/Users/yo/Desktop/CSC510/HW1/dataset_facialFeatures/csv/shuffledColor.csv', header=FALSE, sep=",")
d <- read.csv('C:/Users/yo/Desktop/CSC510/HW3/cifar10/shuffledCifarStandardizedMeanShift.csv', header=FALSE, sep=",")
# d <- read.csv('C:/Users/yo/Desktop/CSC510/HW3/cifar10/shuffledCifarNormalized.csv', header=FALSE, sep=",")
dt <- d[1:61440,] #80%
dt <- d[1:61440,] #80%
dv <- d[61441:81920,] #20%
# install.packages("randomForest")
# install.packages("party")
# install.packages("tictoc")
library(randomForest)
library(party)
library(tictoc)

start <- Sys.time()
tic("sleeping")
outcome <- as.factor(dt$V65)
f1 <- dt$V1 
f2 <- dt$V28
f4 <- dt$V9
f3 <- dt$V59
  
set.seed(12)
cifar.output.rf <- randomForest(outcome ~ f1 + f2 + f3 + f4, data = dt, ntree=300)
summary(cifar.output.rf)
print(cifar.output.rf)
print(cifar.output.rf$confusion)
plot(cifar.output.rf)

varImpPlot(cifar.output.rf, type=2)
text(cifar.output.rf)
print(round((importance(cifar.output.rf, type = 2))))
diag1 <- cifar.output.rf$confusion[1,1]
diag2 <- cifar.output.rf$confusion[2,2]
diag3 <- cifar.output.rf$confusion[3,3]
diag4 <- cifar.output.rf$confusion[4,4]
diag5 <- cifar.output.rf$confusion[5,5]
diag6 <- cifar.output.rf$confusion[6,6]
diag7 <- cifar.output.rf$confusion[7,7]
diag8 <- cifar.output.rf$confusion[8,8]
diag9 <- cifar.output.rf$confusion[9,9]
diag10 <- cifar.output.rf$confusion[10,10]

accuracy <- 100*((diag1 + diag2 + diag3 + diag4 + diag5 + diag6 + diag7 + diag8 + diag9 + diag10)/61440)
sprintf("Accuracy: %.2f%%", accuracy)

tree <- getTree(cifar.output.rf, 1, labelVar=TRUE)
# cf <- cforest(outcome ~ ., data=dt, controls=cforest_control(mtry=2, mincriterion=0))

# print(totalErr) #approximation error based on means of all errors given

# pred <- predict(cifar.output.rf, dv, type="response")
Sys.time() - start
toc()
