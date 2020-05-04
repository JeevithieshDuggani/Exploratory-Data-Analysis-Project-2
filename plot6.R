##  Load initialize.R
source("initialize.R")
##  Identify the SCC of the motorcycle related sources
if (!exists("motorSources")) motorSources <- grep("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
if (!exists("motorSourcesSCC")) motorSourcesSCC <- SCC[motorSources,]$SCC
##  Create a data frame of the  Emissions in Baltimore City, Maryland
if (!exists("baltimoreEmissions")) baltimoreEmissions <- NEI[NEI$fips == "24510",]
##  Create a data frame of the  Emissions in Los Angeles, California
if (!exists("losAngelesEmissions")) losAngelesEmissions <- NEI[NEI$fips == "06037",]
##  List of all the motorcycle based Emissions
if (!exists("motorEmissionsB")) motorEmissionsB <- baltimoreEmissions[baltimoreEmissions$SCC %in% motorSourcesSCC,]
##  List of all the motorcycle based Emissions
if (!exists("motorEmissionsL")) motorEmissionsL <- losAngelesEmissions[losAngelesEmissions$SCC %in% motorSourcesSCC,]
##  Create a list of the total Emissions in each year
if (!exists("yearlyEmissionsMotorB")) yearlyEmissionsMotorB <- tapply(motorEmissionsB$Emissions, 
                                                                      as.factor(motorEmissionsB$year), 
                                                                      sum, simplify = FALSE
                                                               )
if (!exists("yearlyEmissionsMotorL")) yearlyEmissionsMotorL <- tapply(motorEmissionsL$Emissions, 
                                                                      as.factor(motorEmissionsL$year), 
                                                                      sum, simplify = FALSE
                                                               )
##  Start the graphic device
png("plot6.png")
##  Create space for 2 graphs
par(mfrow = c(1,2))
##  Plot the graph
plot(main = "Baltimore City",
     as.numeric(names(yearlyEmissionsMotorB)), yearlyEmissionsMotorB, 
     ylim = c(130,7400),
     xlab = "Year", ylab = "Yearly Emissions by Baltimore",
     type = "h", lwd = 15, col = "grey", lend = 2
)
plot(main = "Los Angeles",
     as.numeric(names(yearlyEmissionsMotorL)), yearlyEmissionsMotorL, 
     ylim = c(130,7400),
     xlab = "Year", ylab = "Yearly Emissions by Los Angeles",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end

##  The emissions from Los Angeles are way higher than those of Baltimore city.
##  Baltimore has more changes percentage wise whereas Los Angeles has more changes in magnitude.
##  Pollution in Los Angeles increased over the years (1999-2005), decreasing in 2008. 2008 > 1999.
##  Pollution in Los Angeles increased over the years (1999-2008). 1999 > 2008.