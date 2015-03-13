##plot6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

LAonroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
Balonroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')

LAdf <- aggregate(LAonroad[, 'Emissions'], by=list(LAonroad$year), sum)
colnames(LAdf) <- c('year', 'Emissions')
LAdf$City <- paste(rep('Los Angeles', 4))

Baldf <- aggregate(Balonroad[, 'Emissions'], by=list(Balonroad$year), sum)
colnames(Baldf) <- c('year', 'Emissions')
Baldf$City <- paste(rep('Baltimore', 4))

combine <- as.data.frame(rbind(LAdf,Baldf))

png("plot6.png",width=480,height=480,bg="transparent")
ggplot(data=combine, aes(x=year, y=Emissions)) + 
     geom_bar(aes(fill=year),stat="identity") +
     ggtitle('Total Emissions of Motor Vehicle in Baltimore & Los Angeles 1999-20008') + 
     ylab('Emissions') + 
     xlab('Year') + 
     theme(legend.position='none') + 
     facet_grid(. ~ City) + 
     geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))
dev.off()






