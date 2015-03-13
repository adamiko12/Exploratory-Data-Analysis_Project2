##plot1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

totalNEI <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png",width=480,height=480,bg="transparent")
barplot(totalNEI/1000000, main = "Total Emissions by Year", xlab="Year", ylab="Emissions (1,000,000 Tons)")
dev.off()
