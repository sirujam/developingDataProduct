## Global.R

## placeholder for easier access from server.R and ui.R
Mobile_Subscription <- "Mobile Subscription"
Individual_Internet <- "Internet Usage Percent"

## Load the countryList required for Drop down list 
countryList <- read.csv("Country_list.csv", stringsAsFactors = FALSE)
colnames(countryList) <- "Country"

## Get data and clean the data
## result :: dataframe
getUNData <- function(){
  
  mobSubFile <<- "Mobile_Subscription.csv"
  intRateFile <<- "Internet_Rate.csv"
  
  
  ## Read data and structure the data
  mobSub <- read.csv(mobSubFile, stringsAsFactors = FALSE)
  intRate <- read.csv(intRateFile, stringsAsFactors = FALSE)
  
  colnames(mobSub) <- c("Country","Year","Subscription","Footnote1")
  colnames(intRate) <- c("Country","Year","Internet","Footnote2")
  
  
  ## Merge data and clean up
  comb <- merge(mobSub, intRate, all = TRUE)
  
  good <- is.na(comb$Subscription)  
  comb$Subscription[good] <- 0
  
  good <- is.na(comb$Internet)
  comb$Internet[good] <- 0L
  
  
  ## clean up temporary data
  rm(mobSub)
  rm(intRate)
  
  ## Segregating mobile era
  return(comb[comb$Year >= 1980,])
}