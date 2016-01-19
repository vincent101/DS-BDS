predBDS <- function(fb, testX, eta, B){
    source("predDS.r")
    pred <- matrix(0,nrow(testX),1)
    for (b in 1:B) {
        pred <- pred+eta*predDS(fb[b,],testX)
    }

    #MSE <- 0
    #for (i in 1:length(testX)) {
        #pred <- 0
        #for (b in 1:B) {
            #pred[i] <- pred+eta*predDS(fb,testX[i])
    #    }
        #MSE <- MSE+(testY[i]-pred)^2
    #}
    #MSE <- MSE/length(testX)
    return(pred)
}
