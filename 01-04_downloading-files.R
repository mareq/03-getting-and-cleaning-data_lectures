orig_wd <- getwd()
orig_wd
getwd()
setwd("..")
getwd()
setwd("/tmp")
getwd()
setwd(orig_wd)
getwd()

datadir <- "data"
if(!file.exists(datadir)) {
  dir.create(datadir)
}
setwd(datadir)
getwd()

fileUrlHttp <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrlHttp, destfile = "cameras_http.csv", method="curl")

#install packages("downloader")
require(downloader)

fileUrlHttps <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download(fileUrlHttps, "cameras.csv", mode = "wb")

fileUrlXlsx <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download(fileUrlXlsx, "cameras.xlsx", mode = "wb")

list.files(datadir)

dateDownloaded <- date()

dump(c("fileUrlHttp", "fileUrlHttps", "dateDownloaded"), file="downloadStatus")


