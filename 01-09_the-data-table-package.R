library(data.table)

DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
print(DF)

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
print(DT)

tables()

DT[2,]
DT[DT$y == "a",]
DT[c(2,3)] # subsetting list of rows
DT[,c(2,3)] # NOT subsetting list of columns!!! It rather performs that function on data
DT[,list(mean(x), min(z))] # get mean of values in column x, get minimum of values in column z
DT[,table(y)] # summarize values in column y
DT[,w:=z^2] # add new column named w containing sqare of corresponding z value
DT

DT2 <- DT # this is not a copy, it is only a reference!!!
DT[,m:={tmp <- (x+z); log2(tmp+5)}]  # therefore both DT and DT2 are changed by this
DT2[,a:=x>0]  # therefore both DT and DT2 are changed by this
DT
DT2

DT3 <- copy(DT) # this will do deep copy
DT3[,b:=mean(x+w),by=a] # therefore this will change only DT3; "by" will group rows by selected criteria and all rows of the same group will be assigned the same value
DT
DT2
DT3

set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x] # print number of occurences (count) of individual rows for each group (by column x)

DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300), z=rep(c("d","e","f"),each=100))
setkey(DT, x) # set column x to be the key
head(DT['a']) # so that it is used for subscripting
setkey(DT, z) # change key
head(DT['f'])

DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x); # set ("foreign") keys
merge(DT1, DT2) # so that they are used for table join

big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file)) # compare time needed to read some big file
system.time(read.table(file, header=TRUE, sep="\t"))

# melt, dcast


