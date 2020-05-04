##  Load initialize.R
source("initialize.R")
##  Identify the SCC of the motorcycle related sources
if (!exists("motorSources")) motorSources <- grep("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
if (!exists("motorSourcesSCC")) motorSourcesSCC <- SCC[motorSources,]$SCC
##  Create a data frame of the  Emissions in Baltimore City, Maryland
if (!exists("baltimoreEmissions")) baltimoreEmissions <- NEI[NEI$fips == "24510",]
##  List of all the motorcycle based Emissions
if (!exists("motorEmissionsB")) motorEmissionsB <- baltimoreEmissions[baltimoreEmissions$SCC %in% motorSourcesSCC,]
##  Create a list of the total Emissions in each year
if (!exists("yearlyEmissionsMotorB")) yearlyEmissionsMotorB <- tapply(motorEmissionsB$Emissions, 
                                                                      as.factor(motorEmissionsB$year), 
                                                                      sum, simplify = FALSE
)
##  Start the graphic device
png("plot5.png")
##  Plot the graph
plot(main = "Yearly Emissions of PM2.5 by Motor Vehicles in Baltimore City",
     as.numeric(names(yearlyEmissionsMotorB)), yearlyEmissionsMotorB, 
     xlab = "Year", ylab = "Yearly Emissions by Baltimore",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end

##  The emissions drop from 1999 to 2002, almost stay the same from 2002 to 2005, and drop in 2008.