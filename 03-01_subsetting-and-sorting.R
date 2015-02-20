set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA
X

X[,1] # column 1
X[,"var1"] # column "var1" (i.e. column 1)
X[1:2, "var2"] # rows 1,2 of column "var2"
X[c(2,4,5), "var3"] # rows 2,4,5 of column "var3"
X[(X$var1 <= 3 & X$var3 > 11),] # all rows where "var1" is <= 3 and "var3" is > 11
X[(X$var1 <= 3 | X$var3 > 15),] # all rows where "var1" is <= 3 or "var3" is > 15
X[(X$var2 > 8),] # subsetting on NAs does not work as expected
X[which(X$var2 > 8),] # which command helps to overcome problem with NAs

X$var1
sort(X$var1) # ascending sort
sort(X$var1, decreasing=TRUE) # descending sort
X$var2
sort(X$var2) # omit NAs
sort(X$var2, na.last=TRUE) # put NAs at the end
sort(X$var2, na.last=FALSE) # put NAs at the beginning

X$var1
order(X$var1) # get ordering of "var1"
X[order(X$var1),] # sort X by "var1"
X[order(X$var1, X$var3),] # sort X by "var1" and "var3"

library(plyr)
arrange(X,var1) # sort by "var1" ascending
arrange(X,desc(var1)) # sort by "var1" descending

X$var4 <- rnorm(5) # add column to existing frame
X
cbind(X,rnorm(5)) # add column to the right of existing frame
cbind(rnorm(5), X) # add column to existing frame to the left of existing frame


