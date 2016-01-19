BDS <- function(trainX, trainY, s1, s2, eta, B){
    source("DS.r")
    r <- trainY
    fb <- c()
    fbM <- matrix(,B,4)
    for (b in 1:B) {
        fb <- DS(trainX, r, s1, s2)
        fbM[b,] <- fb
        if (fb[1]==1) {
            threshold <- trainX[,1]<fb[2]
        }
        if (fb[1]==2) {
            threshold <- trainX[,2]<fb[2]
        }
        r[threshold] <- r[threshold]-eta*fb[3]
        r[!threshold] <- r[!threshold]-eta*fb[4]
    }
    return(fbM)
}
