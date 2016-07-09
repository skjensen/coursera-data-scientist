#sub(",","",variable) #Substitutes , with nothing. Effectively removes the comma.
#gsub(",","",variable) # Remove ALL , in the string not just the first.



question1 <- function(){
  
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/HOUSING.csv")){
    #Download the CSV files, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/HOUSING.csv", mode='wb')
    dateDownloaded <- date()
  }
  
  df_raw <- read.csv("./data/HOUSING.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)
  
  names <- strsplit(names(df_raw),"wgtp")
  print(names[123])
  
}

question2 <- function(){
  
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/GDP.csv")){
    #Download the CSV files, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/GDP.csv", mode='wb')
    dateDownloaded <- date()
  }
  
  #Read the raw csv file into a dataframe skipping first 5 lines and only reading 190 lines. 
  df_gdp <- read.csv("./data/GDP.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=FALSE, skip=5, nrows = 190)
  
  df_gdp$V5 = as.numeric(gsub(",", "",(df_gdp$V5)))
  
  #view the dataframe
  View(df_gdp)
  
  #Calculate the mean of V5 - GDP
  mean(df_gdp$V5)
  
}

question3 <- function(){
  
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/GDP.csv")){
    #Download the CSV files, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/GDP.csv", mode='wb')
    dateDownloaded <- date()
  }
  
  #Read the raw csv file into a dataframe skipping first 5 lines and only reading 190 lines. 
  df_gdp <- read.csv("./data/GDP.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=FALSE, skip=5, nrows = 190)
  
  df_gdp$V5 = as.numeric(gsub(",", "",(df_gdp$V5)))
  
  #view the dataframe
  View(df_gdp)
  
  print(grep("^United",df_gdp$V4), 3)
  print(grep("*United",df_gdp$V4), 2)
  print(grep("^United",df_gdp$V4), 4)
  print(grep("United$",df_gdp$V4), 3)
  
}

question4 <- function(){
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/GDP.csv")){
    #Download the CSV files, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/GDP.csv", mode='wb')
  }
  if(!file.exists("./data/education.csv")){
    #Download 2nd file
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/education.csv", mode='wb')
    dateDownloaded <- date()
  }
  
  df_gdp <- read.csv("./data/GDP.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=FALSE, skip=5, nrows = 190)
  df_edu <- read.csv("./data/education.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)

  
  #Merge the two data frames
  df_merged <- merge(df_gdp,df_edu,by.x="V1", by.y="CountryCode", SORT=TRUE)
  
  #Cast V2 to numeric so it can be ordered correctly
  df_merged$V2 = as.numeric(df_merged$V2)
  df_merged$V5 = as.numeric(gsub(",", "",(df_merged$V5)))
  
  View(df_merged)
  
  df_fiscal <- df_merged[grep("+fiscal", df_merged$Special.Notes, ignore.case=TRUE), ]
  df_june <- df_merged[grep("+june", df_fiscal$Special.Notes, ignore.case=TRUE), ]
  
  View(df_june)

  print(paste("Number of countries for which the end of the fiscal year is June: ", nrow(df_june)))
    
}


question5 <- function(){
#library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

year2012 <- sampleTimes[year(sampleTimes) == 2012]
print(paste("2012: ", length(year2012)))

monday <- year2012[wday(year2012) == 2]
print(paste("Mondays: ", length(monday)))


}




