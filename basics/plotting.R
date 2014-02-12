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

####################
## Basic plotting ##
####################

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

## You can also turn off all labels by setting the ann (for annotation)
## argument to false:

plot(myvect, ann = FALSE)

## Other key help pages to refer to:
?plot.default
?par


############################
## Axis limits and Aspect ##
############################

## you can set the range of each axis with xlim and ylim:

smallnums <- seq(-1, 1, length.out = 10)
bignums <- seq(-10, 10, length.out = 10)
plot(smallnums, bignums)

plot(smallnums, bignums, xlim = c(-5, 5))

## If you want to use the same scale on both axes, set asp = 1:

plot(smallnums, bignums, asp = 1)

## This is important if the absolute distances between points is
## meaningful, as in ordination plots!

###########################
## High-level Plot Types ##
###########################

hist(iris$Sepal.Length)

boxplot(iris$Sepal.Length)
boxplot(Sepal.Length ~ Species, data = iris)

stripchart(iris$Sepal.Length)
stripchart(Sepal.Length ~ Species, data = iris)
stripchart(Sepal.Length ~ Species, data = iris, method = "jitter")
stripchart(Sepal.Length ~ Species, data = iris, method = "jitter",
           vertical = TRUE)

## Dynamite plots?


#################################
## Adding Information to Plots ##
#################################

plot(Sepal.Length ~ Sepal.Width, data = iris)

#############
## Symbols ##
#############

## pch = "plot character"

plot(Sepal.Length ~ Sepal.Width, data = iris, pch = 1) # default
plot(Sepal.Length ~ Sepal.Width, data = iris, pch = 2) # custom!

## 25 different symbols available:
plot(1:25, pch = 1:25)

## You can use any ascii characters:

plot(1:26, pch = letters)

## Any numeric vector can be used to set values.
## Recall that factors are actually numbers with labels!

plot(Sepal.Length ~ Sepal.Width, data = iris, pch = as.numeric(Species))

#############
## Colours ##
#############

## col = "symbol colour"

## Eight colours can be selected by number:
plot(1:10, col = 1:10, pch = 15, cex = 4)


## Colours can also be selected by name:
plot(1:10, col = "red", pch = 15, cex = 4)
plot(1:10, col = c("blue", "red"), pch = 15, cex = 4)

## Note how the colour vector is recycled!

plot(rep(1:25, 20), rep(1:20, each = 25), pch = 15, cex = 2.5,
     col = colours(distinct = TRUE))

## colours() returns a list of all the named colours R knows

## other important colour functions:
##   palette() : change the numbered colours
##   rainbow(), heat.colors() etc : create interesting palettes
##   rgb() : create your own colours

## Putting this to work:

plot(Sepal.Length ~ Sepal.Width, data = iris, pch = as.numeric(Species),
     col = as.numeric(Species))

##########################
## cex and bubble plots ##
##########################

## cex controls the size of plot points

library(vegan)
data(dune)
data(dune.env)
dune.rda <- rda(dune)
dune.sites <- scores(dune.rda, display = "sites")
plot(dune.sites)
plot(dune.sites, cex = as.numeric(dune.env$Moisture))

#####################
## Low-level Plots ##
#####################

## All of the plots we've used so far have been 'high-level'. This means
## that they take over the entire plot window - you can't combine them
## with other plots. You can however add 'low-level' plotting commands
## to existing high-level plots. The parameters are very similar, so
## they should work fairly intuitively.

## Start with an empty plot:
plot(Sepal.Length ~ Sepal.Width, data = iris, type = 'n')

## add points for one versicolor:
points(Sepal.Length ~ Sepal.Width, data = subset(iris, Species ==
                                     "versicolor"))

## add points for virginica, setting different options:
points(Sepal.Length ~ Sepal.Width, data = subset(iris, Species ==
                                     "virginica"),
       pch = 5, col = 8)

points(Sepal.Length ~ Sepal.Width, data = subset(iris, Species ==
                                     "setosa"),
       pch = 3, col = 5)

## add any number of arbitrary points:

points(x = 4, y = 6.5, pch = "X", cex = 5, col = "turquoise")

## Adding lines:

plot(Wind ~ Temp, data = airquality)

## Calculate the regression
wind.temp.lm <- lm(Wind ~ Temp, data = airquality)

wind.temp.lm
summary(wind.temp.lm)

abline(wind.temp.lm, col = "red")

## Adding text
text(90, 18, "high", cex = 4)
text(65, 3, "low", cex = 4)


## Interactively exploring your data:

plot(Murder ~ Assault, data = USArrests)

identify(USArrests[, c("Assault", "Murder")])
identify(USArrests[, c("Assault", "Murder")], labels = row.names(USArrests))

plot(Murder ~ Assault, data = USArrests, type = 'n')

text(Murder ~ Assault, data = USArrests, labels = row.names(USArrests))

##############
## Workflow ##
##############

## Producing figures with code is a very different process than using a
## point-and-click program. It is tedious at first, but the benefit in
## the long-run is being able to reproduce the same plot for multiple
## datasets or different subsets. The key to this approach is to use
## your script files to generate your plots - change one thing at a time
## and re-send the script, don't re-enter data each time you send a plot
## command! 
