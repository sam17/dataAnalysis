corr <- function(directory, threshold = 0)
{
  correl <- numeric()
  fil <-length(list.files(paste("./",directory,"/",sep="")))
  ids <- 1:fil
  for(i in ids)
  {
    dat <- complete(directory,i) 
    if(dat[,"nobs"]>threshold)
    {
      a <- read.csv(file =paste("./",directory,"/",sprintf("%03d",i),".csv",sep=""))
      newa <- subset(a,!is.na(sulfate)&!is.na(nitrate),select=c("sulfate","nitrate"))
      rel <- cor(x=newa[,"sulfate"],y=newa[,"nitrate"],use='all.obs',method="pearson")
      rel <- sprintf("%.4f",rel)
      rel <- as.numeric(rel)
      correl<-c(correl,rel)
    }  
  }
  correl
}

