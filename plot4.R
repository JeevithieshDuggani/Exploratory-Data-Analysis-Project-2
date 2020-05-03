##  Load initialize.R
source("initialize.R")
##  Identify the indices of the coal combustion related sources
if (!exists("coalSources")) coalSources <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
if (!exists("coalSourcesSCC")) coalSourcesSCC <- SCC[coalSources,]$SCC
##  List of all the coal based Emissions
if (!exists("coalEmissions")) coalEmissions <- NEI[NEI$SCC %in% coalSourcesSCC,]
##  Create a list of the total Emissions in each year
if (!exists("yearlyEmissionsCoal")) yearlyEmissionsCoal <- tapply(coalEmissions$Emissions, 
                                                                  as.factor(coalEmissions$year), 
                                                                  sum, simplify = FALSE
                                                           )
##  Start the graphic device
png("plot4.png")
##  Plot the graph
plot(main = "Yearly Emissions of PM2.5 by Coal",
     as.numeric(names(yearlyEmissionsCoal)), yearlyEmissionsCoal, 
     xlab = "Year", ylab = "Yearly Emissions by Coal",
     type = "h", lwd = 15, col = "grey", lend = 2
)
##  close the graphic device
dev.off()
##  end

## The amount of Emissions by coal drops from 1999 to 2002, rises a little from 2002 to 2005 and decreases heavily in 2008.