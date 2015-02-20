library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"),measure.vars=c("mpg","hp","qsec"))
#head(carMelt,n=3)
#tail(carMelt,n=3)
carMelt[carMelt$carname == "Mazda RX4",]
carMelt[carMelt$carname == "Volvo 142E",]

cylData <- dcast(carMelt, cyl ~ variable) # by default just counts records
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean) # calculate mean instead of counting records
cylData

tapply(mtcars$hp, mtcars$cyl, mean) # apply function (3rd arg) to values (1st arg) group by index (2nd arg)
cylSplit <- split(mtcars$hp, mtcars$cyl) # split values (1st arg) group by index (2nd arg)
cylSplit
cylCnt = lapply(cylSplit, mean) # apply function (2nd arg) to list of values (1st arg): for each vector in list, calculate mean
cylCnt
unlist(cylCnt) # convert list to a vector
sapply(cylSplit, mean) # lapply & unlist
library(plyr)
ddply(mtcars, .(cyl), summarize, sum=mean(hp)) # apply function <3rd arg>(<1st arg>, <4th arg>, <5th arg>, ...) group by (2nd arg)
ddply(mtcars, "cyl",  summarize, sum=mean(hp)) # the same as the line above (with more conscious syntax)
ddply(mtcars, .(cyl,gear),      summarize, sum=mean(hp)) # the same, just with groupping by two columns
ddply(mtcars, c("cyl","gear"),  summarize, sum=mean(hp)) # the same as the line above (with more conscious syntax)
cylSum = ddply(mtcars, "cyl", summarize, sum=ave(hp,FUN=mean))
cylSum

# computing something like cylSum is good for this type of calculations (cylSum has the same dimensions as the original unsummarized data)
mtcars[mtcars$cyl == 8,"hp"] - cylSum[cylSum$cyl == 8,"sum"]

#head(InsectSprays)
#tapply(InsectSprays$count, InsectSprays$spray, sum)
#spIns = split(InsectSprays$count, InsectSprays$spray)
#spIns
#lapply(spIns, sum)
#ddply(InsectSprays, .(spray), summarize, sum=sum(count))
#spraySums <- ddply(InsectSprays, .(spray), summarize, sum=ave(count,FUN=sum))
#spraySums

# acast (casting as multidimensional arrays), arrange (faster than order()), mutate


