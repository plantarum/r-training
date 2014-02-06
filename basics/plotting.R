##################################
## Learning Objectives:
##   High-level Plotting commands
##   - how to invoke them
##   - how to set display options


##################################
## Low-level Plotting commands
##   - how to add features high-level plots

##################################
## Interactive Plot tools
##   - how to interogate your plots

##################################
## Work flow for preparing figures

## Start with a simple vector
myvect <- 10:1

## the main plotting command is `plot`:

plot(myvect)

## R guesses what kind of plot you want based on the class of the
## object you give it:

class(myvect)

## By default, the values of one-dimensional vectors are plotted
## in order, almost like time-series.

class(women)

plot(women)

## data.frames and matrices with numerical data are plotted as
## scatter plots by default. 

## There are lots of options, and lots of help files for plot:

?plot

## important arguments:
## x :: if x is a vector, and y is absent, plot like a time series.

plot(myvect)

## if x is a matrix or data.frame of numerical values, plot as a scatterplot:

plot(women)

## if x is a vector, and y is also a vector, plot as a scatterplot:

myvect2 <- c(6:10, 1:5)
plot(myvect, myvect2)

## Note that x and y are the first two arguments, so I haven't
## named them explicitly. You could also call this as:

plot(x = myvect, y = myvect2)

## or

plot(y = myvect2, x = myvect)

## Something you will often see in scatterplots, particularly
## with regression, is the 'formula' syntax:

plot(myvect2 ~ myvect)

## Note that there are no commas here, and y comes first!

## type :: what kind of symbols do you want to plot?

plot(myvect, type = "p")                # the default, points
plot(myvect, type = "l")                # a connected line
plot(myvect, type = "b")                # points and a line
plot(myvect, type = "s")                # steps
plot(myvect, type = "n")                # no symbols

## the type = "n" option is useful when you want to specify
## particular details of the symbols yourself.

## Most plot types can also take arguments for main, sub, xlab,
## and ylab.

plot(myvect, main = "My plot")
plot(myvect, main = "My plot", xlab = "Order")

## You can probably guess what ylab does. Try sub to find out
## where it goes.

## Note that each of these four arguments can be set to the empty
## string to omit the labels from your plot:

plot(myvect, xlab = "", ylab = "")

## You can also turn off all labels with by setting the ann (for
## annotation) argument to false:

plot(myvect, ann = FALSE)

## Other key help pages to refer to:
?plot.default
?par



## Discuss aspect along with xlim and ylim
## Another key parameter of most plot types is the aspect,
## specified by the asp option.

## Compare these two plots:

plot(myvect, myvect2)
