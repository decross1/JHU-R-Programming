best <- function(state, outcome) {

        ## Set the WD with the outcome data
        setwd(cro202/My Documents/JHU Data Science Spec/R Programming/Programming Assignment 3")
        
        ## To read in the outcome data
        dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## To Check whether that state is within the data set
        states <- dat[ , 7]
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        if ((state %in% states) == FALSE) {
                stop(print("invalid state"))
        }
        else if ((outcome %in% outcomes) == FALSE) {
                stop(print("invalid outcome"))
        }
        
        ## subset the data with states
        dat2 <- subset(dat, State == state)
        
        ## To get data from the referenced column in the args
        if (outcome == "heart attack") {
                rates <- 11
        }
        else if (outcome == "heart failure") {
                rates <- 17
        }
        else {
                rates <- 23
        }
        ## replace all na
        needed <- as.numeric(dat2[,rates])
        bad <- is.na(needed)
        actual_data <- dat2[!bad, ]
        
        # To find the min hospital in the state
        variable_col <- as.numeric(actual_data[, rates])
        variable_row <- which(variable_col == min(variable_col))
        hospitals <- actual_data[variable_row, 2]
        
        ## In the Case of a Tie-Breaker
        ## Returns the first hospital name from the alphabetically sorted hospitals
        if (length(hospitals) > 1) {
                hospitals_sort <- sort(hospitals)
                hospitals_sort[1]
        }
        else {
                hospitals
        }
}
