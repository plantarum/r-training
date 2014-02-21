##' Identify variables with the highest correlation in a data set
##'
##' Given a matrix or data.frame, return a list of all variables that
##' have at least one correlation > `thresh` with another variable. For
##' each variable in this set, return the list of the `lim` variables
##' with the greatest (absolute) correlations.
##' 
##' @title Summarize variables with high correlations
##' @param dat a numerical matrix or data frame
##' @param lim the number of correlations to display for each of the
##' variables identified
##' @param thresh the correlation threshold to use when searching for
##' variables 
##' @return A list of lists. The first list corresponds to the variable
##' with the highest correlation with another variable in the matrix.
##' The list reports the top `lim` absolute correlations for the named
##' variable. 
##' @author Tyler Smith
topcor <- function(dat, lim = 5, thresh = 0.9){
  cors <- cor(dat)
  res <- list()
  for (i in 1:nrow(cors)){
    tmp <- list(cors[i, order(abs(cors[i,]), decreasing = TRUE)][1:(1 + lim)])
    if (tmp[[1]][2] > thresh){
      lab <- names(tmp[[1]])[1]
      res <- c( res, list(tmp[[1]][-1]))
      names(res)[length(res)] <- lab
    }
  }
  res  
}
