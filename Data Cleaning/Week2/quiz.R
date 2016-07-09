question2 <- function(){
  library(sqldf)
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, destfile="./pid.csv")
  
  acs <- read.csv("./pid.csv", header=TRUE, sep=",")
  
  sqldf("select pwgtp1 from acs where AGEP < 50")
}

question3 <- function(){
  library(sqldf)
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, destfile="./pid.csv")
  
  acs <- read.csv("./pid.csv", header=TRUE, sep=",")
  
  sqldf("select distinct AGEP from acs")
}

question4 <- function(){
  hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
  con <- url(hurl)
  htmlCode <- readLines(con)
  close(con)
  sapply(htmlCode[c(10, 20, 30, 100)], nchar)
}
question5 <- function(){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
  download.file(fileUrl, destfile="./wksst8110.for")
  data <- read.csv("./wksst8110.for", header = TRUE)
  head(data)
  #file_name <- "./wksst8110.for"
  df <- read.fwf("./wksst8110.for", skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
  #df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
  sum(df[, 4])

  
}
