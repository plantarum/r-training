## Objectives:
## Using functions
## Loading data
## Examining data
## Saving data

###############
## Functions ##
###############

## Loading and saving data uses some complex functions. So before we get to input/output,
## we'll go over how R functions work.

## R functions are called by name, with all of their arguments provided inside brackets
## after the name. Let's take a closer look at the scale() function as an example:

## First, we need some data to scale:
mymat <- iris[1:6, 1:4]

## Now take a look at the help for scale:
?scale

## scale() has three arguments: x, center, and scale. When we call the function, we can
## provide these arguments in order:

scale(mymat, TRUE, FALSE)

## mymat is the first argument, so it is used in place of 'x' in the function. TRUE is the
## second argument, so it is used in place of center, and FALSE is used in place of scale.
## The result is the mymat matrix is centered (the mean of each column is subtracted from
## all the values in that column), but not scaled (which means each value is divided by
## the standard deviation of its column).

## It's very easy to forget the order argument should be in, so you can make a
## mistake calling a function like this. It's better to use the argument names:

scale(mymat, center = TRUE, scale = FALSE)

## This is the same as the first function call. When you use the argument names, the order
## isn't important anymore, so this is also the same:

scale(mymat, scale = FALSE, center = TRUE)

## You could also do this:

scale(center = TRUE, x = mymat, scale = FALSE)

## Take another look at the help file. Note that in the 'usage' section it shows:
##       scale(x, center = TRUE, scale = TRUE)

## This means that center has a default value of TRUE, and scale has a default value of
## TRUE. Which means that if you don't call these arguments, R assumes they are both TRUE.
## On the other hand, x doesn't have a default value, so it is a required argument -
## scale() won't work without it.

## Back to our function call above - since we are using the default value of center, we
## don't need to use this argument:

scale(mymat, scale = FALSE)

## Most of the time, we'll use scale to standardize our data, which uses both scaling and
## centering. That means we can just use:

scale(mymat)

##################
## Loading data ##
##################

## R provides several functions for loading data files, all with many different options
## and defaults. We'll start with read.table(), which is the most general. First, open the
## help:

?read.table

## Note that there are many arguments, but only the first one is required. So we can start
## with something simple:

mydf <- read.table("mydata.csv")

## R is not happy! By default, R expects any whitespace values to be column separators.
## In our data, only tabs separate data, so we need to tell R not to consider spaces or
## other whitespace as field separators. We do this with the sep argument:

mydf <- read.table("mydata.csv", sep = "\t")

## That's more promising. Take a look at the table now:

mydf

## It might not all fit on your screen at once. The 'head' function selects the first few
## rows (like in bash).

head(mydf)

## Notice the first row: V1 V2 V3 ... - R has treated every row in the table as data, and
## made up new names for the columns. But look at the actual table - the first row isn't
## data, it's column headings. We need to let R know with the header argument:

mydf <- read.table("mydata.csv", sep = "\t", header = TRUE)

head(mydf)

## That looks better. But we've included the plot names in the data. We can tell R to use
## these as row names. We do this by setting row.names = 1, which means the first column
## contains row names, not data:

mydf <- read.table("mydata.csv", sep = "\t", header = TRUE, row.names = 1)
head(mydf)

## Now we can select rows using the plot names, which is easier and less error-prone than
## using numbers:

mydf["PLOT10",]
mydf[10,]

## "PLOT10" will always be "PLOT10", but the contents of the 10th row in the data frame
## might move to the 9th row if you remove a plot in your analysis!


####################
## Reviewing Data ##
####################

## Now we can take a look at our data:

summary(mydf)
str(mydf)

## Summary provides a quick summary of each variable/column. str provides a slightly
## different preview.

## Look at the first column, DISTURBANCE. We can see from the summary output that there
## are two disturbance classes, oldgrowth and secondary. str provides the same
## information, and explicitly indicates that R has converted this column into a factor.
## By default, R treats all text columns as factors. That makes sense for disturbance,
## since it records one of two categories for each plot.

## Compare this with notes. Notes is clearly not a categorical variable, it is in fact
## just field notes. This is data we may want to keep, but we don't want it interpreted as
## a factor with discrete levels. (Actually, it doesn't really matter unless we are actually
## going to use 'notes' in an analysis). We can turn notes back into text using the
## as.character function:

mydf$notes                              # the contents of notes
as.character(mydf$notes)                # converting notes to character type
mydf$notes = as.character(mydf$notes)   # permanently altering the notes column

## Alternatively, we can inform R that we want the notes column left 'as-is' when we
## import it, rather than being converted into a factor:

mydf <- read.table("mydata.csv", sep = "\t", header = TRUE, row.names = 1, as.is = 20)

## Note that as.is refers to the 20th column in the original file. There are different
## ways to do this, explained in ?read.table

## Now take a look at REGION. Summary tells us that it is an integer, with the minimum,
## mean and maximum values all equal to 2. That is, every value is 2. This is not going to
## be a useful variable in any analysis!

## The third variable is AREA. str tells us AREA is a factor with 5 levels. But the
## summary output shows us something fishy: there are three levels called upslope,
## differing only in capitalization. R treats them as if they were all different levels,
## but they're really the same. This is one of the benefits of using factors - it's very
## easy to see if you've made little spelling errors.

## We can't fix this problem with read.table. Either we need to fix the original
## spreadsheet, or we need to fix the data after it is loaded into R. I prefer the later,
## as we will have a permanent record of every alteration we make to our data.

## To find all AREAS coded as "UPSLOPE":

mydf$AREA[mydf$AREA == "UPSLOPE"]

## To find all AREAS coded as "Upslope":

mydf$AREA[mydf$AREA == "Upslope"]

## Now to correct this, we could assign new values to each of these vectors:

# mydf$AREA[mydf$AREA == "Upslope"] = "upslope"

## In this case, we'd have to do this twice, once for Upslope and once for UPSLOPE.
## Alternatively, we can combine the two operations:

mydf$AREA[mydf$AREA %in% c("Upslope", "UPSLOPE")]

## %in% returns TRUE for any elements in the left side vector that are in the right side
## %vector.

## Nothing is fixed until we make the new assignment:
mydf$AREA[mydf$AREA %in% c("Upslope", "UPSLOPE")] = "upslope"

## We could have made these changes with find and replace in our spreadsheet program.
## However, that leaves no permanent record. What if you later realize that you recorded
## all of your plots from the crest of a hill as UPSLOPE, and used upslope for plots for
## plots between the middle of the slope and the crest? Your R script records the change.
## Since we haven't changed the original data in the csv file, if we alter our script we
## can 'undo' the change.

## Now to check our numeric data. R gives us enormous graphical power. We'll just use some
## basics here:

hist(mydf$ELEV)

## Nothing suprising here.

hist(mydf$SLOPE)

## Ouch! SLOPE isn't numeric. summary and str show us it is actually a factor. Why?

mydf$SLOPE

## The fifth value of SLOPE is 'none'. This was entered for a plot that didn't have a
## slope value recorded. R can't make 'none' into a number, so instead it turns none and
## all the numbers into characters, then converts them into a factor. Not what we want!

## To fix it, first we need to remove the 'none' value:

mydf$SLOPE[mydf$SLOPE == 'none'] = NA

## NA, without quotes, is how R indicates a missing (or Not Available) value. Because of
## the way factors are stored by R, we can't convert them directly to numbers:

as.numeric(mydf$SLOPE)

## Instead, we need to convert them first into characters:

as.character(mydf$SLOPE)

## And then to numbers:

as.numeric(as.character(mydf$SLOPE))

## That's better. Reassign SLOPE and we're done:

mydf$SLOPE = as.numeric(as.character(mydf$SLOPE))

## We can avoid this problem with read.table, and our raw data. In your raw data tables,
## if a value is missing, R interprets it as NA. R will also interpret the string NA as
## NA. So if you don't want to have blanks in your spreadsheet, using NA will avoid the
## problem. Alternatively, you can use the na.strings argument of read.table to tell R
## what you used to represent missing values in your data. So we could have done this:

# mydf <- read.table("mydata.csv", sep = "\t", header = TRUE, row.names = 1, as.is = 20,
#                    na.strings = "none")

## This would have caused any occurence of 'none' to be replaced by NA when loaded into R.
## We won't do that now, as we'd have to re-fix AREA as well.

##############
## Exercise ##
##############

## Find and fix three more columns that have problems in mydf!

#################
## Saving Data ##
#################

## There are two principal ways to save R objects. If you just want to save objects to
## resuse in a later R session, you can use the save() function.

?save

## There are many arguments, but we really just need to use two: file and list. 'file' is
## the name of the file to create, and list is a character vector containing all the
## objects to save. For example:

a = 1:10
b = matrix(letters, nrow = 13)

save(file = "myRData.RData", list = c("a", "b", "iris", "mydf"))

## The file extension is not necessary in R - it doesn't care what the extension is.
## However, using .RData for save files makes it easier to keep track of them for you. To
## check that it worked, first see what's in our current workspace:

ls()

## Now remove everything:

rm(list = ls())

ls()

## Now reload our objects:

load("myRData.RData")

ls()

## You can also do the same thing without the list argument:

save(a, b, iris, mydf, file = "myRData.RData")

## If you do this, the object names shouldn't be in quotes.

## save and load are convenient, but they are no help if you want to analyze your data in
## another program. For this we use the partner of read.table, which is write.table.

write.table(mydf, "mydf-corrected.csv")

## Open mydf-corrected.csv in a spreadsheet program - it's all there as you would expect.
## One nice thing about write.table is that it produces a file that exactly matches the
## defaults for read.table. This means that we don't need to fuss about with the
## arguments, we can just call it:

## First, remove mydf from R's memory:

rm(mydf)

## Now re-read the table from disk:

mydf <- read.table("mydf-corrected.csv") # don't worry about header, as.is, row.names etc!
mydf

## write.table will only save a single data frame or matrix as a single spreadsheet table.
## If you want to save multiple objects, or to save objects that aren't matrices or data
## frames, you'll have to find specialized functions for doing this. For example, the
## phylogenetic package ape provides functions for reading and writing nexus files and
## Newick trees.
