## Lesson 2: Data Types
## ==

## Objectives:
## Understand data types: numeric (integers), character, logical, factor
## Understand data structures: vector, matrix, data.frame, list
## Learn to manipulate data structures: filter, select, modify, combine

#############
## Numbers ##
#############

## By default, R treats all numbers as vectors of numeric values.
## Numeric in R means the same thing as 'float', 'floating point' or
## 'double' in other languages. Essentially, a numeric is a decimal
## number, even if it doesn't have a decimal point.

## (R also has an 'integer' class, which is derived from the 'numeric'
## class. Integers cannot have decimal values. You don't need to worry
## about the difference unless you are combining your R code with code
## from languages that use integers, like C or Fortran).

## Examples of numerics:

1
2
pi
1:10
-16.4

## Note: R does all calculates using high precision values, but by
## default it truncates long decimals for the display:

pi
options(digits = 20) ## Display 20 digit precision
pi
options(digits = 7) ## Display 7 digit precision

## You do not need to set digits to a high value to get high precision -
## it only affects the way values are displayed, not how how they are
## used in calculations!

##########
## Text ##
##########

## All text values in R belong to the 'character' class. 'character'
## values must be enclosed in quotations to distinguish them from
## variable names. You can use either single or double quotes, as long
## as you use the same kind. Examples:

"hello"
'hi there'

x = "R is cool"
y <- 'R is cool'                        # <- and = do the same thing

x
'x'

x == y                                  # == and = are not the same!

'x' == y

###########
## Logic ##
###########

## Two equal signs together without a space, '==', tells R you want to
## test if two objects have the same value. The answer belongs to a
## third data class: logical. Logical values can be either TRUE or
## FALSE.

## Logical values can be added - TRUE == 1, FALSE == 0. This is a useful
## way to determine how many values meet a condition:

## A random sample of 30 numbers:
myrand = sample(30, replace = TRUE)

## how many values are greater than 25?
myrand > 25

sum(myrand > 25)

#############
## Factors ##
#############

## Categorical variables are stored as factors. Factors are important
## when you are building models, such as in ANOVA, that have discrete
## levels.

myfact = factor(c("exp", "control", "exp", "control"))
myfact

## Note that typing an object without an assignment into the console
## simply prints its contents to the screen. It doesn't do anything
## else. I add these lines throughout the lessons to remind you to
## examine the contents of your objects to make sure you understand
## what's inside them!

#############
## Vectors ##
#############

## All of the data so far has been aggregated together into vectors. A
## vector is a one-dimensional collection of values, and the values must
## all be the same class. You can make vectors with the c() function:

charvect = c("one", "two", "three")
logicvect = c(TRUE, FALSE, T, TRUE, F)  # You can use T and F instead
                                        # of TRUE and FALSE 
numvect = c(1, 2, 3)

## To make vector with series of consecutive integers, you can use the
## colon operator:

1:3
3:15
6:-2

## R also provides vectors of the lower-case and upper-case alphabet:

letters
LETTERS

## Most mathematical operations in R are 'vectorized'. This means they
## apply to every element in a vector:

3 + 2
3 + numvect
sqrt(numvect)

## You can also combine vectors using mathematical operations:

vect1 = 1:4
vect2 = c(10, 20, 30, 40)

vect1 + vect2

##############
## WARNING! ##
##############

## R will let you combine vectors of different lengths. It will do this
## by 'recycling' values in the shorter vector. You will usually get a
## warning when this happens, because it's probably not want you
## intended to do!

vect3 = 1:3

vect1 + vect3

## You can select only part of a vector with the square brackets:

## Select the 17th letter:
letters[17]

## Select the first 10 letters:
letters[1:10]

## Negative numbers return the vector with that element missing.
## Select all but the 17th letter:

letters[-17]

## Select all but the first 10 letters:
letters[-1:-10]

## Note that the selections tell R not just what elements to show, but
## also what order they should be in:

letters[1:10]
letters[10:1]

## You can also use logical values to select elements:

newvect = 1:20
newvect < 9  # this tests each value, and returns TRUE if it is less
             # than 9
newvect[newvect < 9]

animals <- c("dog", "cat", "fish", "salamander", "bat")
animals != "cat"                        # != tests for inequality

animals[animals != "cat"]

## None of these operations have changed any of the objects:
letters

## In order to actually change a vector, you need to assign a new value
## to it:

numvect

numvect[3]

numvect[3] <- 5

numvect

## Vectors can't have more than one kind of data. If you try and make a
## vector with a combination of data types:

newvect <- c(1, 2, 3, "one", "two", "three")

newvect[1]

newvect + 1 ## can't add numbers to text!

## The result is a vector of the most inclusive data class. Text can't
## be represented as numbers, but numbers can be represented as text, so
## everything gets turned into text.

## You can add to a vector, or combine it with another vector, using c():

vect1 = 1:5
vect2 = 6:10
c(vect1, vect2)
c(vect1, vect2, 20)

##############
## Matrices ##
##############

## Matrices are vectors with two or more dimensions. Like vectors, they
## can only contain a single data type. You can make them with the
## matrix() function:

mymat = matrix(data = 1:12, nrow = 3, ncol = 4)
mymat

## You can access and change matrix elements just like vectors, except
## now you need two values in the brackets. The first values is the row,
## the second is the column:

## Select the value in the second row, third column:

mymat[2, 3]

## If you leave a value out, you select the whole row or column:

## Select the second row:
mymat[2,]

## Select the third column:
mymat[,3]

## You can use negative numbers to exclude elements, and you can change
## elements just like in vectors. If you want to change a whole row or
## column, you need to have enough values to fill it up:

mymat[,1]
mymat[,1] = 20:22

mymat

## If you try to replace a row or column with fewer values than are in
## that row, the replacement values get recycled. For example:
mymat[,3] = 42
mymat

## Matrices are 'vectorized', just like vectors, so you can manipulate
## the whole matrix at once:

mymat
mymat * 2
mymat + 10

## Sometimes matrix rows and columns will be given names, to make it
## easier to manage them:

rownames(mymat) ## none yet!

rownames(mymat) = c("row1", "row2", "row3")
colnames(mymat) = c("col1", "col2", "col3", "col4")

mymat

## You can use the row and column names in the square brackets:

mymat["row1",]
mymat[,"col4"]
mymat["row1", c("col1", "col3")]

## You can add a row to a matrix with rbind(), or a column with cbind():

mymat
rbind(mymat, 1:4)
cbind(mymat, 15:17)

## Notice that the new rows and columns don't have names yet.

#################
## Data Frames ##
#################

## If you want to collect data of different types together in a matrix,
## you need to use a data frame:

mydf <- data.frame(site = c("forest", "field", "stream", "bog"),
                   pH = c(6, 7, 5, 3), diversity = c(30, 40, 50, 20),
                   shade = c(T, F, T, F))

## Each column in a data frame must have the same data type, but
## different columns can have different types. You can access values the
## same as in matrices, but you can also use a shortcut for getting
## individual columns:

mydf$pH
mydf$diversity

###########
## Lists ##
###########

## Lists are heterogeneous collections of objects. Like, data frames,
## each object can be a different type. Unlike data frames, each object
## can also be a different length.

mylist <- list(nums = 1:10, capitals = LETTERS,
               favourite.color = "maroon", sky.blue = TRUE)

## You can access and modify list elements using much like in data
## frames. However, to use square brackets you need to use *two pairs*:

mylist$sky.blue
mylist[["capitals"]]
mylist[[1]]


###############
## Exercises ##
###############

## 1
## Create the following matrix:
##       spec1 spec2 spec3 spec4
## site1   5     7     9     11
## site2   2     0     1      3
## site3   7     3     2      1

## 2
## make a new matrix with site2 and species 3 removed

## 3
## add species 5 to the matrix: abundance 5, 9, 1

## 4
## add site 4 to the matrix, species 4, 7, 3, 8, 10

## 5
## sum the values in site1 and site2

## 6
## sum the values for each species in site1, site2, site3 and site4

## 7
## compare your result to the output of 'colSums(your_matrix)',
## replacing 'your_matrix' with the name of the matrix you created.

## 8
## R comes with many built-in data sets. One of these is the famous iris
## dataset, collected by Anderson and used by Fisher in developing
## discriminant analysis. You can see the entire dataset in the object
## 'iris':

iris

## Start by looking at the Species column on its own:

iris$Species

## 8A
## Notice the 'Levels' at the end - this is a factor. Use a test to find
## out which rows belong to the species versicolor:

## 8B
## Use this result to select all the rows (with every column included)
## in iris that have data from versicolor plants:

## The functions max(vect), min(vect), mean(vect) and range(vect) will
## calculate useful summary statistics on the vector 'vect'.

## 8C
## What is the maximum Sepal.Length in the iris data set?

## 8D
## What is the minimum Petal.Width in Iris setosa?

## 8E
## Subtract the mean Sepal.Width from all the Sepal.Widths in the iris
## data

## 8F
## Calculate a shape index for Iris petals - divide the petal length by
## the petal width for each row.

## 8G
## Test the result from 8F - which specimens have a shape ratio less
## than 2.5?

## 8H
## Use the result from 8G to extract all the rows in Iris with a petal
## shape index less than 2.5

## Other useful functions for working with matrices and dataframes (see
## the help pages for details):

## scale(): standardize columns by subtracting the mean, dividing by the
##   standard deviation, or both
## nrows(): returns the number of rows in a matrix or data frame
## length(): returns the length of a vector
## sum(): adds all the values in a vector
## sd(): returns the standard deviation of all the values in a vector

