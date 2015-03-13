##plot3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

Baltimore<-subset(NEI, NEI$fips==24510)

png("plot3.png",width=480,height=480,bg="transparent")
ggplot(data=Baltimore, aes(x=year, y=Emissions, fill=type)) + 
        geom_bar(stat="identity", position="dodge") +
        ggtitle("Baltimore (Maryland) Emission by Type: 1999-2008")
dev.off()













