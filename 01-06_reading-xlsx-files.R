datadir <- "data"
setwd(datadir)

library(xlsx)
cameraData <- read.xlsx("cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("cameras.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
print(cameraDataSubset)

#write.xlsx
#write.xlsx2 # this one's faster
#XLConnect package has more options for writing and manipulating Excel files


