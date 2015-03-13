##plot5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

df <- aggregate(onroad[, 'Emissions'], by=list(onroad$year), sum)
colnames(df) <- c('year', 'Emissions')

png("plot5.png",width=480,height=480,bg="transparent")
ggplot(data=df, aes(x=year, y=Emissions, fill = year)) + 
       geom_bar(stat="identity", position="dodge") + 
       ggtitle("Total Emissions of Motor Vehicle Sources in Baltimore City (Maryland) 1999-2008")+
       geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
dev.off()
