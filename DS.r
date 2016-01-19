# Implement Decision Stumps
DS <- function(trainX, trainY, s1, s2){
    RSS <- matrix(Inf,ncol(trainX),max(length(s1),length(s2)))
    for (i in 1:ncol(trainX)) {
        if (i == 1)  s <- s1
        else s <- s2
        for (j in 1:length(s)) {
            threshold <- trainX[,i]<s[j]
            yBelowS <- trainY[threshold]
            yOverS <- trainY[!threshold]
            RSS[i,j] <- sum((yBelowS-mean(yBelowS))^2)+sum((yOverS-mean(yOverS))^2)
        }
        # get the s with minimum RSS
    }
    mins <- which(RSS==min(RSS),arr.ind=TRUE)
    if (mins[1,1]==1) {
        threshold <- trainX[,1]<s1[mins[1,2]]
        res <- c(as.integer(mins[1,1]),s1[mins[1,2]],mean(trainY[threshold]),mean(trainY[!threshold]))
    }
    if (mins[1,1]==2){
        threshold <- trainX[,2]<s2[mins[1,2]]
        res <- c(as.integer(mins[1,1]),s2[mins[1,2]],mean(trainY[threshold]),mean(trainY[!threshold]))
    }
    # return the threshold with 2 values
    return(res)
}
