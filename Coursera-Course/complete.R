complete <- function(directory, id = 1:332)
{
  df = data.frame(id = numeric(0),nobs = integer(0))
  for(i in id)
  {
    a <- read.csv(file =paste("./",directory,"/",sprintf("%03d",i),".csv",sep=""))
    nob = sum(!is.na(a[,"sulfate"])&!is.na(a[,"nitrate"]))
    df <- rbind(df, data.frame(id = i, nobs = nob))
  }
  df
}