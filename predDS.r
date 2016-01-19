predDS <- function(fb, testX){
    pred <- matrix(rep(fb[4],nrow(testX)),nrow(testX),1)
    if (fb[1]==1) {
        pred[testX[,1]<fb[2],] <- fb[3]
    }
    if (fb[1]==2) {
        pred[testX[,2]<fb[2],] <- fb[3]
    }
    return(pred)
}
