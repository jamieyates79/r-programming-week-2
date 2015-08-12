pollutantmean <- function(directory, pollutant, id = 1:332) {

  pollutiondata <- data.frame() # Initialises an empty data frame
  
  for(i in id) {
    
    
    # Sets leading zeroes for filename based on i 
    
    if(i < 10) {
        leadingzeroes <- '00'}
    else if (i < 100) {
        leadingzeroes <- '0'
    }
    
    else {
        leadingzeroes <- ''  
    }
    
    fileid <- paste(leadingzeroes,i,sep="")
    filelocname <- paste(directory,'/', fileid,'.csv', sep="") # Builds the file string for the read.csv
    ifiledata <- read.csv(filelocname, header =  TRUE, sep = "," ) # Reads the data from CSV in i to the ifiledata object
    
    pollutiondata <- rbind(ifiledata, pollutiondata) # Appends the ifiledata to pollutiondata 
    
    print(i) # Prints the file number being processed
    
    
    
  }
  
  #if (pollutant == "sulfate") {}
  
  print(mean(pollutiondata[,pollutant], na.rm = TRUE)) # Prints the mean
}
