#' \section{Size}

dev.new(height = 3.5, width = 3.5)

#' \section{Content}
#' 
plot(Sepal.Length ~ Sepal.Width, data = iris)


#' \subsection{Plot Symbols}
#' 

str(iris)
as.numeric(iris$Species)


plot(Sepal.Length ~ Sepal.Width, pch = as.numeric(Species), data = iris)

#' \subsection{Margins}
#' 

par(mar = c(3, 3, 0.5, 0.5))
plot(Sepal.Length ~ Sepal.Width, pch = as.numeric(Species), data = iris)

#' \subsection{Axes}

box()

axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8)
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8)

mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)

par(mar = c(3, 3, 0.5, 0.5))
plot(Sepal.Length ~ Sepal.Width, pch = as.numeric(Species), data = iris, 
     ann = FALSE,                       # turn off axis labels
     axes = FALSE)                      # turn off axis ticks
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)

#' \subsection*{Exercise 1: adding a legend}

legend(legend = levels(iris$Species), x="topleft", pch = 1:3)

#' \subsection{Selecting Plot Symbols}
#' 

mysymbols <- c(19, 5, 3)
plot(Sepal.Length ~ Sepal.Width, pch = mysymbols[as.numeric(Species)], data = iris,
     ylim = c(4.0, 8.5), ann = FALSE, axes = FALSE)
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8)
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
legend(legend = levels(iris$Species), x = "top", pch = mysymbols, horiz = TRUE, 
       bty = 'n', cex = 0.9, text.width = c(0.6, 0.7, 0.6))

mysymbols
as.numeric(iris$Species)
mysymbols[as.numeric(iris$Species)]

#' \subsection{Panels}
#' 

dev.new(width = 7.25, height = 3.5)

par(mfrow = c(1, 2))

par(mfrow = c(1, 2))
par(mar = c(3, 3, 0.5, 0.5))
mysymbols <- c(19, 5, 3)
plot(Sepal.Length ~ Sepal.Width, pch = mysymbols[as.numeric(Species)], data = iris,
     ylim = c(4.0, 8.5), ann = FALSE, axes = FALSE)
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
legend(legend = levels(iris$Species), x = "top", pch = mysymbols, horiz = TRUE, 
       bty = 'n', cex = 0.9, text.width = c(0.6, 0.7, 0.6))

## ----panel2, fig.width=7.25, fig.height=3.5, fig.align="center", echo = FALSE----
boxplot(Petal.Width ~ Species, data = iris)


## ----panel2B, fig.width=7.25, fig.height=3.5, fig.align="center", echo = FALSE----
par(mfrow = c(1, 2))
par(mar = c(3, 3, 0.5, 0.5))
mysymbols <- c(19, 5, 3)
plot(Sepal.Length ~ Sepal.Width, pch = mysymbols[as.numeric(Species)], data = iris,
     ylim = c(4.0, 8.5), ann = FALSE, axes = FALSE)
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
legend(legend = levels(iris$Species), x = "top", pch = mysymbols, horiz = TRUE, 
       bty = 'n', cex = 0.9, text.width = c(0.6, 0.7, 0.6))
## For the first panel:
text("A", x = 4.2, y = 4.5, cex = 2)
boxplot(Petal.Width ~ Species, data = iris)
## For the second panel:
text("B", x = 3.2, y = 0.24, cex = 2)


## ----panel2Bc, fig.width=7.25, fig.height=3.5, fig.align="center", echo = FALSE----
par(mfrow = c(1, 2))
par(mar = c(3, 3, 0.5, 0.5))
mysymbols <- c(19, 5, 3)
plot(Sepal.Length ~ Sepal.Width, pch = mysymbols[as.numeric(Species)], data = iris,
     ylim = c(4.0, 8.5), ann = FALSE, axes = FALSE)
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
legend(legend = levels(iris$Species), x = "top", pch = mysymbols, horiz = TRUE, 
       bty = 'n', cex = 0.9, text.width = c(0.6, 0.7, 0.6))
## For the first panel:
text("A", x = grconvertX(0.9, from="npc", to="user"), 
     y = grconvertY(0.1, from = "npc", to="user"), cex = 2)
boxplot(Petal.Width ~ Species, data = iris)
## For the first panel:
text("B", x = grconvertX(0.9, from="npc", to="user"), 
     y = grconvertY(0.1, from = "npc", to="user"), cex = 2)


#' \subsection*{Exercise 2: Completing the Panel}
#' 
#' There are still a few problems with our panel:
#' 
#' \begin{itemize}
#' \item The title of the Y axis on the second panel is not visible
#' \item The panel labels (A and B) are in the wrong positions --- they should be in the top left corners
#' \item Fixing the panel labels will require moving the legend for the first figure
#' \end{itemize}
#' 
#' If you change \texttt{ylim}, you can put the legend on the bottom, and make space for the label at
#' the top. Go ahead and see what you can do with this. You can use my example, Figure
#' \ref{fig:final-product} as a model. Alternatively, try formatting your own data according to the
#' requirements of a journal in your field.


#' \section{Image Formats}
#'
#' \subsection{Raster Images}

tiff(filename = "iris.tiff", width = 3.5, height = 3.5, units="in", res = 1000,
     compression = "lzw")
par(mar = c(3, 3, 0.5, 0.5))
plot(Sepal.Length ~ Sepal.Width, pch = as.numeric(Species), data = iris, 
     ann = FALSE,                       # turn off axis labels
     axes = FALSE)                      # turn off axis ticks
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8)
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
dev.off()

#' \subsection{Vector Images}
#' 

postscript("iris.eps", height = 3.5, width = 3.5,
           paper = "special", onefile = FALSE, horizontal = FALSE)
par(mar = c(3, 3, 0.5, 0.5))
plot(Sepal.Length ~ Sepal.Width, pch = as.numeric(Species), data = iris, 
     ann = FALSE,                       # turn off axis labels
     axes = FALSE)                      # turn off axis ticks
box()
axis(side = 1, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
axis(side = 2, tcl = -0.2, mgp = c(3, 0.3, 0), cex.axis = 0.8) 
mtext("Sepal Width", side = 1, line = 1.5)
mtext("Sepal Length", side = 2, line = 1.5)
dev.off()

embedFonts("iris.eps", outfile="iris-embed.eps")

