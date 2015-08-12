# pollutantmean <- function(directory, pollutant, id = 1:332) {
  # File contains header
  
  
  
  ## fileid <- '020' # Hard loading file temporarily 
  directory <- "specdata" # Hard loading the directory! This will be passed to function.
  pollutiondata <- data.frame()
  
  
  for(i in 1:332) {
    
    # Sets leading zeroes for filename based on i length
    
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
    ifiledata <- read.csv(filelocname, header =  TRUE, sep = "," )
    
    pollutiondata <- rbind(ifiledata, pollutiondata) # Appends the ifiledata to pollutiondata 
    
    print(i)
    
    }
  

  