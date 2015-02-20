#if(!file.exists("./data")) {
  #dir.create("./data")
#}

# curl: (60) SSL certificate problem: self signed certificate in certificate chain
#fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
#download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")

restData <- read.csv("./data/restaurants.csv")

s1 <- seq(1, 10, by=2); s1
s2 <- seq(1, 10, length=3); s2
x <- c(1,3,8,25,100); seq(along = x)

restData$nearMe = restData$neighborhood %in% c("roland Park", "Homeland")
table(restData$nearMe)

#restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
restData$zipWrong = ifelse(restData$zipCode < 0, "wrong", "ok")
table(restData$zipWrong, restData$zipCode < 0)

quantile(restData$zipCode)
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

yesno <- sample(c("yes","no"), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c("yes", "no"))
yesnofac # Levels: yes no
as.numeric(yesnofac)
relevel(yesnofac,ref="no") # Levels: no yes
as.numeric(yesnofac)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

library(Hmisc)
library(plyr)
restData2 = mutate(restData,zipGroups2=cut2(zipCode,g=4))
table(restData2$zipGroups2)

abs(-42)
sqrt(256)
ceiling(6.022)
floor(6.02214129)
round(6.02214129, digits=4)
signif(6.02214129, digits=4)
sin(pi/2)
cos(2*pi)
exp(1) # euler's constant
log(exp(1))
log2(1024)
log10(1000)


