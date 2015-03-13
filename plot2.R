##plot2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

Baltimore<-subset(NEI, NEI$fips==24510)
totalBaltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)

png("plot2.png",width=480,height=480,bg="transparent")
barplot(totalBaltimore, main="Total Emissions in Baltimore City (Maryland) by Year", xlab="Year", ylab="Emissions (Tons)")
dev.off()

