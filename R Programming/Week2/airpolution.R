corr <- function(directory, threshold=0){
  
  # Get the files names
  file_list <- list.files(path=directory, pattern="*.csv", full.names=TRUE)
  
  # Get a list of files and their complete cases
  complete_cases <- complete(directory)
  
  # Nummeric vector to hold the correlation values  
  correlation <- numeric(0)
  
  # Retrieve pullution data from files with more complete samples than the defined threshold
  for(i in 1:nrow(complete_cases)) {
    row <- complete_cases[i,]
    if (row$nobs > threshold){
      # Open the file and gather Sulfate and Nitrite data
      temp_data <- read.csv(file_list[i],header=TRUE)
      # Append the correlation data from the file to the result vector
      correlation <- append(correlation, cor(temp_data$sulfate, temp_data$nitrate, use = "complete.obs"))
    }
  }
  correlation
}

complete <- function(directory, id = 1:332) {
  
  # Get the files names
  file_list <- list.files(path=directory, pattern="*.csv", full.names=TRUE)
  #print(file_list)
  
  # Create the data frame for filename and number of complete cases
  data_frame <- data.frame(id=numeric(0), nobs= numeric(0))
  # Read the CSV files into the data frame one file at the time. 
  for(i in id){
    #print(sum(complete.cases(read.csv(file_list[i],header=TRUE))))
    data_frame <- rbind(data_frame, list(id = i, nobs = sum(complete.cases(read.csv(file_list[i],header=TRUE)))))
  }
  data_frame
  
}


pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Get the files names
  file_list <- list.files(path=directory, pattern="*.csv", full.names=TRUE)
  #print(file_list)
  
  # Create the data frame for all data
  data_frame <- data.frame(date=character(0), sulfate=integer(0), nitrate=numeric(0), id= numeric(0))
  
  # mean vector
  m <- c()
  
  # Read the CSV files into the data frame one file at the time. 
  for(i in id){
    #print(dim(data_frame))  
    data_frame <- rbind(data_frame, read.csv(file_list[i],header=TRUE))
  }
  print(mean(data_frame[[pollutant]],na.rm=TRUE))
}

