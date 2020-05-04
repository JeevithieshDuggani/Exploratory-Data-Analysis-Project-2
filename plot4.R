##  Load initialize.R
source("initialize.R")
##  Identify the SCC of the combustion related sources
if (!exists("combSources")) combSources <- grep("comb", SCC$SCC.Level.One, ignore.case = TRUE)
if (!exists("combSourcesSCC")) combSourcesSCC <- SCC[combSources,]
##  Identify the SCC of the coal combustion related sources
if (!exists("coalCombSources")) coalCombSources <- grep("coal", 
                                                        combSourcesSCC$SCC.Level.Four, 
                                                        ignore.case = TRUE
                                                   )
if (!exists("coalCombSourcesSCC")) coalCombSourcesSCC <- as.character(combSourcesSCC[coalCombSources,]$SCC)
##  List of all the coal based Emissions
if (!exists("coalCombEmissions")) coalCombEmissions <- NEI[NEI$SCC %in% coalCombSourcesSCC,]
##  Create a list of the total Emissions in each year
if (!exists("yearlyEmissionsCoal")) yearlyEmissionsCoal <- tapply(coalCombEmissions$Emissions, 
                                                                  as.factor(coalCombEmissions$year), 
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