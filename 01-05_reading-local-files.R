datadir <- "data"
setwd(datadir)

#cameraData <- read.table("cameras.csv")
cameraData <- read.table("cameras.csv", sep=",", header = TRUE)
head(cameraData)

cameraData <- read.csv("cameras.csv")
head(cameraData)


