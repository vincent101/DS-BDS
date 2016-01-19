BDSforFunctionOfB <- function(trainX,trainY,testX,testY,s1,s2,eta,BSequence){
    source("DS.r")
    source("BDS.r")
    source("predDS.r")
    source("predBDS.r")
    testMSE <- c()
    for (i in 1:length(BSequence)) {
        B <- BSequence[i]
        fb <- BDS(trainX,trainY,s1,s2,eta,B)
        pred <- predBDS(fb,testX,eta,B)
        testMSE[i] <- mean((pred-testY)^2)
    }
    plot(BSequence,testMSE)
}

