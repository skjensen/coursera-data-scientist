question1 <- function(){
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/housing.csv")){
    #Download the CSV file, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/housing.csv", mode='wb')
    dateDownloaded <- date()
    }
  
  
  df <- read.csv("./data/housing.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)
  #Generate the logical vector
  agricultureLogical <- (df$ACR == 3 & df$AGS == 6)
  #Cut the answer down to only the first 3 values
  head(which(agricultureLogical), n = 3L)  
}


question2 <- function(){
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/jeff.jpeg")){
    dir.create("data")
    #Download the JPEG file, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/jeff.jpeg", mode='wb')
    dateDownloaded <- date()
  }
  # Read the picture
  img <- readJPEG("./data/jeff.jpeg", native = TRUE)
  #Get the 30th and 80th quantile
  quantile(img, c(.30, .80)) 
}


question3 <- function(){
  #Check if the data folder exist, if not create it.
  if(!file.exists("./data/GDP.csv")){
    #Download the CSV files, and create a date variable for the file.
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/GDP.csv", mode='wb')
    #Download 2nd file
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv?accessType=DOWNLOAD"  
    download.file(fileUrl,destfile="./data/education.csv", mode='wb')
    dateDownloaded <- date()
  }
  
  df_gdp <- read.csv("./data/GDP.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=FALSE, skip=5, nrows = 190)
  df_edu <- read.csv("./data/education.csv", na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)

    
  #View(df_gdp)
  #View(df_edu)
  
  #Merge the two data frames
  df_merged <- merge(df_gdp,df_edu,by.x="V1", by.y="CountryCode", SORT=TRUE)
  
  #Cast V2 to numeric so it can be ordered correctly
  df_merged$V2 = as.numeric(df_merged$V2)
  df_merged$V5 = as.numeric(gsub(",", "",(df_merged$V5)))
  

  
  #Sort the merged data frame
  df_merged_sorted <- df_merged[order(df_merged$V2, decreasing = TRUE, na.last = TRUE),]
  
  #View the data frame
  #View(df_merged_sorted)
  
  #Number of matches: 
  print(nrow(df_merged_sorted))
  
  #Print row 13 country name:
  print(df_merged_sorted[13,"V4"])

  #Question 4: 
  #Group by Income group, then find the average ranking.  
  print(aggregate(df_merged_sorted[, "V2"], list(df_merged_sorted$Income.Group), mean))
 
  
  #Question 5
  df_merged_sorted$RankGroups <- cut(df_merged_sorted$V2, breaks = 5)
  table(df_merged_sorted$RankGroups, df_merged_sorted$Income.Group)
  
  #df_merged_sorted$RankGroups <- cut2(df_merged_sorted$Rank, g=5)
  #table(df_merged_sorted$RankGroups, df_merged_sorted$`Income.Group`)
  
}
  
  
  
  
  

