pollutantmean <- function(directory, pollutant, id = 1:332) 
{
  sum <- 0.0
  len <- 0
  for(i in id)
  {
    a <- read.csv(file =paste("./",directory,"/",sprintf("%03d",i),".csv",sep=""))
    sum <- sum + sum(a[,pollutant],na.rm=TRUE)
    len <- len + sum(!is.na(a[,pollutant]))
  }
  
  m<- sum/len
  sprintf("%.3f",m)
}