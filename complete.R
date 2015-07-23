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


