##  Load initialize.R
source("initialize.R")
##  Identify the SCC of the motorcycle related sources
if (!exists("motorCSources")) motorCSources <- grep("motorcycle", SCC$Short.Name, ignore.case = TRUE)
if (!exists("motorCSourcesSCC")) motorCSourcesSCC <- SCC[motorCSources,]$SCC
##  Create a data frame of the  Emissions in Baltimore City, Maryland
if (!exists("baltimoreEmissions")) baltimoreEmissions <- NEI[NEI$fips == "24510",]
##  List of all the motorcycle based Emissions
if (!exists("motorCEmissions")) motorCEmissions <- baltimoreEmissions[baltimoreEmissions$SCC %in% motorCSourcesSCC,]
##  Create a list of the total Emissions in each year (both categories)
if (!exists("yearlyEmissionsMotorC")) yearlyEmissionsMotorC <- tapply(motorCEmissions$Emissions, 
                                                                      as.factor(motorCEmissions$year), 
                                                                      sum, simplify = FALSE
)
##  Start the graphic device
png("plot5.png")
##  Plot the graph
plot(main = "Yearly Emissions of PM2.5 by Motorcycles in Baltimore City",
     as.numeric(names(yearlyEmissionsMotorC)), yearlyEmissionsMotorC, 
     xlab = "Year", ylab = "Yearly Emissions by Baltimore",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end
