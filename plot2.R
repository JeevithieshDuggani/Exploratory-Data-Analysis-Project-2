##  Load initialize.R
source("initialize.R")
##  Create a data frame of the  Emmisions in Baltimore City, Maryland
baltimoreEmmisions <- NEI[NEI$fips == "24510",]
##  Create a list of total Emmisions in a year
yearlyEmmisionsBaltimore <- tapply(baltimoreEmmisions$Emissions, baltimoreEmmisions$year, sum)
##  Start the graphic device
png("plot2.png")
##  Plot the graph
plot(main = "Yearly Emmisions of PM2.5 in Baltimore City, Maryland",
     names(yearlyEmmisionsBaltimore), yearlyEmmisionsBaltimore, 
     xlab = "Year", ylab = "Baltimore City's Yearly Emmisions",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end

##  The Emmisions drop heavily from 1999 to 2002. From 2002 to 2005 there is a large increase and then it drops to an all time low in 2008.
