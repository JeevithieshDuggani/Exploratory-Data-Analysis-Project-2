##  Load initialize.R
source("initialize.R")
##  Create a list of the total Emissions in each year
if (!exists("yearlyEmissions")) yearlyEmissions <- tapply(NEI$Emissions, as.factor(NEI$year), 
                                                          sum, simplify = FALSE
                                                   )
##  Start the graphic device
png("plot1.png")
##  Plot the graph
plot(main = "Yearly Emissions of PM2.5",
     as.numeric(names(yearlyEmissions)), yearlyEmissions, 
     xlab = "Year", ylab = "Yearly Emissions",
     type = "h", lwd = 15, col = "grey", lend = 2
     )
##  close the graphic device
dev.off()
##  end

##  The Emissions drop heavily from 1999 to 2002. From 2002 to 2005 there is a slight decrease and then it drops quite heavily in 2008.
