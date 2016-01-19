## DS & BSD
===

### 1. Implement DS on training set, find the MSE on the test set
get the testMSE = 50.96166      

    > source("DS.r")
    > source("predDS.r")
    > fb <- DS(trainX,trainY,s1,s2)
    > pred <- predDS(fb,testX)
    > testMSE <- mean((pred-testY)^2)

### 2. Implement BDS on training set, find the MSE on the test set
get the testMSE = 16.76572      

    > source("BDS.r")
    > source("predBDS.r")
    > eta <- 0.01
    > B <- 1000
    > fb <- BDS(trainX,trainY,s1,s2,eta,B)
    > pred <- predBDS(fb,testX,eta,B)
    > testMSE <- mean((pred-testY)^2)
 
### 3. Plot the testMSE for a fixed value of eta as a function of B=1:B0
the testMSE decrease then increase by the increase of B0, like this:

    > source("BDSforFunctionOfB.r")    
    > BSequence <- seq(200,4000,200)                                                      
    > BDSforFunctionOfB(trainX,trainY,testX,testY,s1,s2,eta,BSequence)  


![image](https://raw.githubusercontent.com/vincent101/DS-BDS/master/ScreenShot1.png)
