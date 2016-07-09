
question1 <- function(){
  #Load all data into a data frame
  file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  df <- read.csv(file, na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)
  
  #Use the Plyr function count to find the frequency of values in column VAL
  count(df, "VAL")
}

question3 <- function(){
  #library(xlsx)
  #Check if the data folder exist, if not create it.
  if(!file.exists("data")){dir.create("data")}

  #Download the Excel file, and create a date variable for the file.
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"  
  download.file(fileUrl,destfile="./data/NGAP.xlsx", mode='wb')
  dateDownloaded <- date()
  
  #Only read requested rows and columns and save in data frame "dat"
  rowIndex <- 18:23
  colIndx <- 7:15
  dat <- read.xlsx(file="./data/NGAP.xlsx",sheetIndex=1,colIndex=colIndx,startRow=18, endRow=23, header=TRUE)
  head(dat)
  
  #The code to run for Question 3:
  sum(dat$Zip*dat$Ext,na.rm=T)
  
}


question4 <- function(){
  library(XML)
  
  #Check if the data folder exist, if not create it.
  if(!file.exists("data")){dir.create("data")}
  
  #Download the Excel file, and create a date variable for the file.
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml?accessType=DOWNLOAD"  
  download.file(fileUrl,destfile = "./data/resturants.xml", mode='wb')
  dateDownloaded <- date()
  
  #Read the XML file
  doc <- xmlTreeParse(file="./data/resturants.xml",useInternal=TRUE)
  rootNode <- xmlRoot(doc)
  #Extract only zipcode values from the file
  zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
  count(l)
  #Look for the zipcode 21321 in the output
}

question5 <- function(){
  library(XML)
  
  #Check if the data folder exist, if not create it.
  if(!file.exists("data")){dir.create("data")}
  
  #Download the Excel file, and create a date variable for the file.
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"  
  download.file(fileUrl,destfile = "./data/idahoHousing.csv", mode='wb')
  dateDownloaded <- date()
  
  #Read the XML file
  DT <- fread("./data/idahoHousing.csv")
  
  print(system.time(mean(DT$pwgtp15,by=DT$SEX)))
  
 # print(system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))) 
  
  print(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
  
  print(system.time(DT[,mean(pwgtp15),by=SEX]))
  
  #print(system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))
  
  print(system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))
  
  
  
}




quiz <- function(){
  #question1()
  #question3()
  #question4()
  question5()
}