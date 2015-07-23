makeCacheMatrix <- function(x = matrix()) 
{
        m <- NULL
        
        set <- function(y) 
        {
                x <<- y
                m <<- NULL
        }
        
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, 
             get = get,
             setmean = setmean,
             getmean = getmean)       
}

vect1 <- (1:5)

meanfunc <- function(vect1)
{
        y = sum(vect1)
        z = length(vect1)
        x <- y / z
        x
}
meanfunc(vect1)
 c <- c(3, 4, 1, 4, 2, 1)
mean(c)
