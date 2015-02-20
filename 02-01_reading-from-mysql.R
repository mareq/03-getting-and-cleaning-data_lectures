library(RMySQL)

ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)
head(result)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")

allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19, "affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2;")

result <- dbGetQuery(hg19, "select matches, misMatches from affyU133Plus2 limit 10;")
result
class(result)

query <- dbSendQuery(hg19, "select matches, misMatches from affyU133Plus2 where misMatches between 1 and 3 limit 16")
query
class(query)
affyMis <- fetch(query)
class(affyMis)
quantile(affyMis$misMatches)
dbClearResult(query)

query <- dbSendQuery(hg19, "select matches, misMatches from affyU133Plus2 where misMatches between 1 and 3 limit 16")
affyMisSmall <- dbFetch(query, n=10)
affyMisSmall
affyMisSmall <- dbFetch(query, n=10)
affyMisSmall
affyMisSmall <- dbFetch(query, n=10)
affyMisSmall
affyMisSmall <- dbFetch(query, n=10)
affyMisSmall
dbClearResult(query)

dbDisconnect(hg19)


