## Lesson 4: Package Management
## ==

## Objectives:
## 1.  Finding packages
## 2.  Installing and using packages

##############
## Packages ##
##############

## Before we start programming our own R functions, we need to know what is already
## available, how to find it and how to install it on our computer. In addition to the
## core, R can be extended by a wide variety of packages. Individual R packages are
## installed in one or more libraries on your computer/server. The words library and
## package are often used interchangeably, but technically a library is a collection of
## packages.

## As an example, R does not include a function for linear discriminant analysis. There is
## a function in the MASS package that does this. MASS is the package written to accompany
## one of the primary R reference texts, "Modern Applied Statistics with S". MASS is one of
## the recommended R packages, and is included in the standard R distribution. However,
## before you can use it, you need to tell R to fetch it from the library:

library(MASS)

## Now all the functions and help files from MASS are available to you:

?lda

## Here's a quick example. We won't worry about the details.

z <- lda(Species ~ ., iris)
z

## Default plot:
plot(z)

## With colors and symbols:
eqscplot(predict(z)$x, pch = unclass(iris$Species), col = unclass(iris$Species))

######################
## Finding Packages ##
######################

## If you want to use a package that is not distributed with the R basic installation,
## you'll need to download and install it. To get started, the canonical source for R
## packages is found at the R website:

browseURL("http://www.r-project.org")

## The menu-bar on the left side has an entry for CRAN under Download, Packages. CRAN
## stands for the Comprehensive R Archive Network. Click on that link, then pick one of
## the mirrors. All the mirrors have the same information, so just pick one close by.

## (Unfortunately, the R website adheres to cutting-edge web design practice circa 1996,
## which makes it awkward to link to specific pages.)

## A new menu appears on the left. Two key links are: 'packages' and 'task views'.
## Packages provides a list of all the packages submitted to CRAN, sorted by name or date.
## These packages are submitted by the user community. The CRAN system insures that they
## meet minimum code standards, and are installable on your system. It does not insure
## that they are statistically sound or analytically appropriate. It is up to you, or more
## realistically, your research community, to evaluate the packages you use. If a
## particular package is in regular use by your peers, (frequently cited in the
## literature, recommended and/or provided by discipline experts etc), then you may be
## reasonably confident that it does what you need it to do.

## Searching througn packages by their names is tedious. The 'Task Views' contains a
## subset of R packages, grouped by area of interest. For instance, there are task views
## for phylogenetics, genetics, and environmetrics.

## Outside of the CRAN system, you can also find R packages:

browseURL("http://www.bioconductor.org/")

## Note the link to "Install" - there are instructions for getting set with Bioconductor
## on R.

browseURL("http://r-forge.r-project.org/")

## For packages that are under very active development, r-forge will often have the latest
## version, whereas CRAN may be a few weeks or months behind.

#########################
## Installing Packages ##
#########################

## Getting a package from CRAN is very easy. Lets try the vegan pacakge, which contains
## many useful functions for vegetation analysis. The easiest way to start is simply to
## tell R you want to install packages:

install.packages()

## R will open up a new window and prompt you to select a repository. Then you will be
## offered a list of packages to choose from. If you do not have permission to install
## files to the root R installation, R will offer to install them to your personal home
## directory instead.

## Once this is done, you can now load the vegan library and start using it:

library(vegan)

## An ordination example from the vegan documentation:

data(varespec)
data(varechem)
vare.dist <- vegdist(varespec)
vare.mds <- monoMDS(vare.dist)
with(varechem, ordisurf(vare.mds, Baresoil, bubble = 5))

## Again, we won't worry about the details for this code.

## Once a package is loaded, it will remain loaded for the rest of your R session. It is
## usually not a problem to have a package loaded if you're not using it. However, it is
## good practice to only load packages if you are going to use them.
