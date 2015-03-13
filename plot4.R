##plot4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

g<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE)) 
subscc<-subset(SCC, EI.Sector %in% g)
subnei<-subset(NEI, SCC %in% subscc$SCC)  

png("plot4.png",width=480,height=480,bg="transparent")
ggplot(data=subnei, aes(x=year, y=Emissions, fill = type)) + 
        geom_bar(stat="identity", position="dodge") + 
        ggtitle("Coal Combustion Source Emissions Across US from 1999-2008")
dev.off()

