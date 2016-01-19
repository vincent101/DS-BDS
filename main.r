# load Boston dataset
library(MASS)
attach(Boston)
X1 <- Boston$lstat
s1 <- seq(1.8,39.7,0.1)
X2 <- Boston$rm
s2 <- seq(3.6,8.7,0.1)
X <- cbind(X1, X2)
Y <- Boston$medv
# split into training and test set
set.seed(0506)
train <- sample(nrow(Boston),nrow(Boston)/2)
trainX <- X[train,]
trainY <- as.matrix(Y[train])
testX <- X[-train,]
testY <- as.matrix(Y[-train])

# fit DecisionStump on train set
source("DS.r")
source("predDS.r")
fb <- DS(trainX,trainY,s1,s2)
pred <- predDS(fb,testX)
testMSE <- mean((pred-testY)^2)

# fit BoostingDecisionStump on train set
source("BDS.r")
source("predBDS.r")
eta <- 0.01
B <- 1000
fb <- BDS(trainX,trainY,s1,s2,eta,B)
pred <- predBDS(fb,testX,eta,B)
testMSE <- mean((pred-testY)^2)

# plot testMSE for a fixed value of eta as a function of B=200:2000 by 200
source("BDSforFunctionOfB.r")
BSequence <- seq(200,4000,200)
BDSforFunctionOfB(trainX,trainY,testX,testY,s1,s2,eta,BSequence)

