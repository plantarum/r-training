## A first R session. 
## Objectives:
## Familiarize ourselves with the R console
## Understand the interface:
##   prompts
##   comments
##   entering commands
##   storing values 
##   using the history
##   tab-completion
##   getting help
##   quiting

## Start R from the command line.
## Key information: R version, how to cite, how to start the help system.
## prompt '>' - this means R is ready and waiting.

## try some math:
2 + 3
4 * 5
pi

cos(pi)
sin(pi)  ## floating point math!!
tan(pi  
    
    ## the command isn't complete, so the prompt changes to '+'
    ## finish the command:

    )
  
## What is the '[1]'?
## Try this:
1:10

1:100

# There are no single numbers (scalars) in R. All numbers are part of a vector, 
# which can contain one or more numbers. 

# What's with all the '#'?
# Try the following:

2 + 3
# 2 + 3

# R ignores anything on a line that follows a '#', so you can use this to add
# comments to your code - information for you, not the computer.

# Storing values in variables:

a = exp(1) 
a
## exp(n) is a function to return the value of e raised to the power n

b <- 42
b
## you can use '<-' instead of '='. They do the same thing in this context.

c <- 2^3
c
## - the '^' indicates an exponent

## We can combine our variables into complex equations:

(-b + sqrt(b^2 -4 * a * c))/(2 * a)

## The quadratic equation. To complete the solution we need to do the 'minus'
## side too. Typing it all back in is tedious. Instead, hit the 'up arrow' key:

## This brings the previous equation back. Now you can move the cursor back
## to replace the first '+' with a '-'.

(-b - sqrt(b^2 -4 * a * c))/(2 * a)

## We can assign that value to a new variable - backup with the arrow and make a
## new variable:

quadratic_equation.solution = (-b + sqrt(b^2 -4 * a * c))/(2 * a)

## You can use upper- and lower-case letters, underscores '_', and periods in 
## your variable names

## That's a long name to type out repeatedly. R can help you with that. At the 
## prompt, type 'q', then hit the tab key twice. R shows you all the different
## objects it knows that start with q. Now continue typing until you have
## 'quadr', then hit tab again. R only knows one object that starts with theses
## five letters, so it auto-completes it for you.

## Before we finish our first session, try out the built in help:

help.start()

## This opens a window in your web browser with links to all the R 
## documentation. Note the address: 127.0.0.1. This is your computer, all of 
## these files are local, you don't need an internet connection to get to them.

## You can also search for help directly from R:

help(t.test)

## This opens the help for t.test using the program 'less'. You can return to R
## by hitting 'q'.

## A shortcut:
?t.test

## If you don't know the name of the help topic you need, you can use this:

help.search("phylogeny")  ## note the quotations

## or the shortcut:
??phylogeny

## Finally, when you're ready to quit, use this:

q()

## R will ask you if you want to save your workspace. I strongly recommend you
## DO NOT do this.


