cameraData <- read.csv("./data/cameras.csv")

names(cameraData)

tolower(names(cameraData))
toupper(names(cameraData))

splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

reviews = read.csv("data/reviews.csv")
solutions = read.csv("data/solutions.csv")
head(reviews, 2)
head(solutions, 2)
names(reviews)
sub("_", "", names(reviews),)

testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

grep("Alameda", cameraData$intersection)
cameraData[grep("Alameda", cameraData$intersection),]
grepl("Alameda", cameraData$intersection)
cameraData[grepl("Alameda", cameraData$intersection),]
head(cameraData[!grepl("Alameda", cameraData$intersection),], 2)
table(grepl("Alameda", cameraData$intersection))

grep("Alameda", cameraData$intersection, value=TRUE)
grep("JeffStreet", cameraData$intersection)
length(grep("JeffStreet", cameraData$intersection))

library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek", 1, 4)
paste("Jeffrey", "Leek")
paste("Jeffrey", "Leek", sep="<->")
paste0("Jeffrey", "Leek")
str_trim("Jeff   \t   ")
