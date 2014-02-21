\name{topcor}
\alias{topcor}
\title{Summarize variables with high correlations}
\usage{
topcor(dat, lim = 5, thresh = 0.9)
}
\arguments{
  \item{dat}{a numerical matrix or data frame}

  \item{lim}{the number of correlations to display for each
  of the variables identified}

  \item{thresh}{the correlation threshold to use when
  searching for variables}
}
\value{
A list of lists. The first list corresponds to the variable
with the highest correlation with another variable in the
matrix. The list reports the top `lim` absolute
correlations for the named variable.
}
\description{
Identify variables with the highest correlation in a data
set
}
\details{
Given a matrix or data.frame, return a list of all
variables that have at least one correlation > `thresh`
with another variable. For each variable in this set,
return the list of the `lim` variables with the greatest
(absolute) correlations.
}
\author{
Tyler Smith
}

