library(dplyr)
chicago <- readRDS("data/chicago.rds")
dim(chicago)
str(chicago)
names(chicago)

head(select(chicago, city:dptp)) # columns "city" through "dptp"
head(select(chicago, -(city:dptp))) # all columns except "city" through "dptp"
i <- match("city", names(chicago)); j <- match("dptp", names(chicago)); head(chicago[, -(i:j)]) # non-dplyr way how to do the same as the line above

chic.f <- filter(chicago, pm25tmean2 > 30) # filter rows where value of "pm25tmean2" is larger than 30
head(chic.f, 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80) # filter rows where value of "pm25tmean2" is greater than 30 and value of "tmpd" is greater than 80
head(chic.f, 10)

chicago <- arrange(chicago, date) # sort the data frame according to "date" column (ascending by default)
head(chicago)
tail(chicago)
chicago <- arrange(chicago, desc(date)) # sort the data frame according to "date" column (descending)
head(chicago)
tail(chicago)
chicago <- arrange(chicago, tmpd, date) # sort the data frame according to "tmpd" column (ascending by default) and then "date" column (ascending by default)
head(chicago)
tail(chicago)

chicago <- arrange(chicago, desc(date)) # sort it back so that are some non-NA values of pm25 visible
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp) # renames columns "pm25tmean2"->"pm25" and "dptp"->"dewpoint"
head(chicago)

chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = TRUE)) # add new column "pm25detrend" which value is difference between value in "pm25" and mean of "pm25" values
head(select(chicago, pm25, pm25detrend))

chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot"))) # add new column "tempcat" with factor denoting hot/cold temperature category
hotcold <- group_by(chicago, tempcat) # this will allow to summarize data by individual groups
head(hotcold)
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), na2 = median(no2tmean2))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900) # the same as above, just with years instead of temperature levels
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), na2 = median(no2tmean2))

# the same above, just with months and more importantly, using pipeline
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), na2 = median(no2tmean2))


