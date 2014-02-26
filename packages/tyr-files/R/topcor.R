
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

