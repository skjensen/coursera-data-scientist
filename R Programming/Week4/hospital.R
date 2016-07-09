# Read the data into a data frame



# Helper function to read the CSV file
# It returns a data frame with the 7 relevant columns
loadHospitalData <- function(){

  #Load all data into a data frame
  df <- read.csv('outcome-of-care-measures.csv', na.strings='Not Available', stringsAsFactors=FALSE, header=TRUE)

  # Subset of relevant columns
  relevant_data <- df[,c(2,7,11,17,23)]
  
  # Apply useful column names
  colnames(relevant_data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  #Return the data frame
  relevant_data
}

best <- function(state, outcome){

  # Get the raw data
  relevant_data <- loadHospitalData()
  #print(dim(relevant_data))
  #head(relevant_data)
  
  # Get the right outcome column, and remove NA values 
  output <- na.omit(relevant_data[, c('hospital','state', outcome)])

  # Filter by state 
  output <- output[which(output$state==state),]    

  #Find minimum value
  min <- min(output[3])
  
  #Find name of the best hospital
  result  <- output[, "hospital"][which(output[3]==min)]
  
  #Return the final result set
  return(result)
  
}

#rankhospital("NC", "heart attack", "worst")
rankhospital <- function(state, outcome, rank){

  # Get the raw data
  relevant_data <- loadHospitalData()
  
  # Get the right outcome column, and remove NA values 
  output <- na.omit(relevant_data[, c('hospital','state', outcome)])
  
  # Filter by state 
  output <- output[which(output$state==state),]    

  #Reorder the hospitals by hospital name
  hospital <- output[order(output[1]), ]
    
  #Reorder the hospitals by outcome value
  ranked <- hospital[order(hospital[3]), ]

  if(rank=="worst"){
    rank <- nrow(ranked)
  }else if(rank=="best"){
    rank <- 1
  }else{
    rank <- rank
  }
  
  #Get outcome value for selected rank
  outcome_value <- ranked[rank,3]

  #Find name of all the hospital with selected rank/outcome value
  result  <- ranked[, "hospital"][which(ranked[3]==outcome_value)]
  
  #Return the final result set
  return(result)
  
}


#rankall("heart attack", 4)
rankall <- function(outcome, rank){
  # Get the raw data
  relevant_data <- loadHospitalData()
  
  # Get the right outcome column, and remove NA values 
  output <- na.omit(relevant_data[, c('hospital','state', outcome)])
  
  #Reorder the hospitals by state name
  stateOrder <- output[order(output[2]), ]
  
  #Reorder the hospitals by hospital name
  hospitalOrder <- stateOrder[order(stateOrder[1]), ]
  
  #Reorder the hospitals by outcome value
  rankedOrder <- hospitalOrder[order(hospitalOrder[3]), ]
  
  #Split the ordered list
  stateList <- split(rankedOrder, rankedOrder$state)


  if (rank=="best"){
    hospitals <- lapply(stateList, function (x) x[x[3]==min(x[3])])
  }
  else if (rank=="worst"){
    hospitals <- lapply(stateList, function (x) x[x[3]==max(x[3])])
  }
  else {
    hospitals <- lapply(stateList, function(x) x[as.numeric(rank), ,drop=FALSE])
  }
  
  #create return structure: data frame with two variables and proper column names
  hospitals<-structure(as.data.frame(do.call(rbind,hospitals)), names=c('hospital','state','outcome'))
  
  #get rid of NAs using states stored in row names
  hospitals$state[is.na(hospitals$state)] <- rownames(hospitals[is.na(hospitals$state),]) 
  
  #return desired output
  result <- hospitals[,c(1,2)]
  
  #Return the final result set
  return(result)
}


extractFromList <- function(){
  
}



quiz <- function(){
  print(paste("1:", best("SC", "heart attack") ))
  print(paste("2:", best("NY", "pneumonia") ))
  print(paste("3:", best("AK", "pneumonia") ))
  print("")
  print(paste("4:", rankhospital("NC", "heart attack", "worst") ))
  print(paste("5:", rankhospital("WA", "heart attack", 7) ))
  print(paste("6:", rankhospital("TX", "pneumonia", 10) ))
  print(paste("7:", rankhospital("NY", "heart attack", 7) ))
  print("")  
  print("8")  
  r <- rankall("heart attack", 4)
  print(as.character(subset(r, state == "HI")$hospital))
  print("9")
  r <- rankall("pneumonia", "worst")
  print(as.character(subset(r, state == "NJ")$hospital))
  print("10")  
  r <- rankall("heart failure", 10)
  print(as.character(subset(r, state == "NV")$hospital))
  
}

