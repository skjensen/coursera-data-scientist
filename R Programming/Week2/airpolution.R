pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Get the files names
  file_list <- list.files(path=directory, pattern="*.csv", full.names=TRUE)
  #print(file_list)
  
  # Create the data frame for all data
  data_frame <- data.frame(date=character(0), sulfate=integer(0), nitrate=numeric(0), id= numeric(0))
  
  # mean vector
  m <- c()
  
  # Read the CSV files inbto the data frame one file at the time. 
  for(i in id){
    #print(dim(data_frame))  
    data_frame <- rbind(data_frame, read.csv(file_list[i],header=TRUE))
  }
  print(mean(data_frame[[pollutant]],na.rm=TRUE))
}
  