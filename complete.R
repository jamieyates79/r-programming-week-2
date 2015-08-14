  complete <- function(directory, id = 1:332) {
    
    nobs <- data.frame() # Initialises an empty data frame
    
    # directory <- "specdata"
    
    # id <- 30:25
    
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
      
      ifilecomplete <- na.omit(ifiledata) # Loads the complete records into a separate data frame
  
      
      
      completerecords <- (nrow(ifilecomplete)) # Counts the complete records 
      
      
      
      nobs <- rbind(nobs,c(completerecords,i)) # Appends the id and the count of completed records into nobs
      names(nobs) <- c("id","nobs") # Updates the column names
      
      # print(c(i,completerecords)) # Prints the file number being processed
      
    }
    print(nobs)
  }
