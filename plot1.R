##  Load initialize.R
source("initialize.R")
##  Create a list of the total Emmisions in each year
yearlyEmmisions <- tapply(NEI$Emissions, as.factor(NEI$year), sum, simplify = FALSE)
##  Start the graphic device
png("plot1.png")
##  Plot the graph
plot(main = "Yearly Emmisions of PM2.5",
     as.numeric(names(yearlyEmmisions)), yearlyEmmisions, 
     xlab = "Year", ylab = "Yearly Emmisions",
     type = "h", lwd = 15, col = "grey", lend = 2
     )
##  close the graphic device
dev.off()
##  end

##  The Emmisions drop heavily from 1999 to 2002. From 2002 to 2005 there is a slight decrease and then it drops quite heavily in 2008.
