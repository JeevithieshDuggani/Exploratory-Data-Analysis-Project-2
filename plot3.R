##  Load the required libraries
require("ggplot2")
##  Load initialize.R
source("initialize.R")
##  Create a data frame of the  Emissions in Baltimore City, Maryland
if (!exists("baltimoreEmissions")) baltimoreEmissions <- NEI[NEI$fips == "24510",]
##  List of total Emissions of different types in each year
if (!exists("yearlyEmissionsbyType")) yearlyEmissionsbyType <- aggregate(Emissions ~ year + type, 
                                                                         baltimoreEmissions, 
                                                                         sum
                                                               )
##  Start the graphical device
png("plot3.png")
##  Plot the graph
graph <- ggplot(yearlyEmissionsbyType, aes(year, Emissions, color = type))
graph <- graph + geom_line() + 
         xlab("Year") + ylab("Yearly Emission in Baltimore City, Maryland") + 
         ggtitle("Yearly Emissions of PM2.5 in Baltimore City, Maryland based on type")
print(graph)
##  close the graphical device
dev.off()
##  end

##  Pollution from a point sources rises from 1999 to 2005 when it falls to just above it's 1999 value in 2008. Increases.
##  Pollution from a non point sources decreases from 1999 to 2002, stays steady from 2002 to 2005 and falls in 2008. Decreases.
##  Pollution from a on road sources decreases from 1999 to 2002 stays steady from 2002 to 2005 and falls in 2008. Decreases.
##  Pollution from a on road sources decreases from 1999 to 2002 stays steady from 2002 to 2005 and falls in 2008. Decreases.