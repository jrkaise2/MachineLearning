#Facial Features: Eye1 vs. Eye2
rm(list=ls())
# install.packages('e1071', dependencies=TRUE)
# install.packages("kernlab")
# install.packages("tidyverse")
library(tidyverse)
library(kernlab)
library(e1071)
library(rpart)
data(iris)
attach(iris)

d <- read.csv('C:/Users/yo/Desktop/CSC510/HW1/dataset_facialFeatures/csv/shuffledEyeHair_Color.csv', header=FALSE, sep=",")
x <- subset(d, select = -V65) #trims off label col.
y <- as.factor(d$V65)

model <- svm(x, y)
print(model)
summary(model)
#check accuracy
pred <- predict(model, x)
confusion <- table(pred, y)
print(confusion)
# #compute decision vals and probs
pred <- predict(model, x, decision.values = TRUE)
accuracy <- ((confusion[1,1] + confusion[2,2])/2048)*100
sprintf("Accuracy: %.2f%%", accuracy)
# # n x c matrix (n number of predicted values, c number of classifiers)
# #of all c binary classifiers' decision values.
# attr(pred, "decision.values")[1:10,]
# #plot ( classes by color, SV by crosses)
plot(cmdscale(dist(d[,-65])), #5 = |features|
     col = as.integer(d[,65]),
     
     pch = c("o","+")[1:2048 %in% model$index + 1]) #150 = |observations|
