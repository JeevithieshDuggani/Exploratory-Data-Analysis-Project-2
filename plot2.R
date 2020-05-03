##  Load initialize.R
source("initialize.R")
##  Create a data frame of the  Emissions in Baltimore City, Maryland
if (!exists("baltimoreEmissions")) baltimoreEmissions <- NEI[NEI$fips == "24510",]
##  Create a list of total Emissions in a year
if (!exists("yearlyEmissionsBaltimore")) yearlyEmissionsBaltimore <- tapply(baltimoreEmissions$Emissions,
                                                                            baltimoreEmissions$year, 
                                                                            sum
                                                                     )
##  Start the graphic device
png("plot2.png")
##  Plot the graph
plot(main = "Yearly Emissions of PM2.5 in Baltimore City, Maryland",
     names(yearlyEmissionsBaltimore), yearlyEmissionsBaltimore, 
     xlab = "Year", ylab = "Baltimore City's Yearly Emissions",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end

##  The Emissions drop heavily from 1999 to 2002. From 2002 to 2005 there is a large increase and then it drops to an all time low in 2008.
