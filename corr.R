
x <- "U:/ProductsGRP/Analytics/Derrick/JHU Data Science Spec/R Programming/Program Assignment 1"
x
getwd()
setwd(x)
list.files()

files_list <- list.files("specdata", full.names = TRUE)


complete <- function(directory, id = 1:332) 
{
        files_list <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        dat2 <- data.frame()
        nobs <- data.frame()
        
        for (i in id)
        {
                dat <- read.csv(files_list[i], header=TRUE)
                nobs <- sum(complete.cases(dat))
                dat2 <- rbind(dat2, data.frame(i, nobs))
        }
        dat2
        
}

length(complete("specdata", 1:332) == 0)



corr <- function(directory, threshold = 0) 
{
        source("complete.R")
        
        dat2 <- complete(directory)
        abovethresh <- dat2[dat2$nobs > threshold,1]
        files_list <- list.files(path = directory, full.names = TRUE)
        correlation <- rep(NA,length(abovethresh))
        
        for (i in abovethresh) 
        {
                data <- (read.csv(files_list[i]))
                dat2 <- complete.cases(data)
                sulfatedata <- data[dat2, 2]
                nitratedata <- data[dat2, 3]
                correlation[i] <- cor(x = sulfatedata, y = nitratedata)
        }
        correlation <- correlation[complete.cases(correlation)]
}
