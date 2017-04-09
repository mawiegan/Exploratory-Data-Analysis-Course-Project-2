# Load the data
setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/00_Data")
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


if(!exists("NEI_SCC")){
  NEI_SCC <- merge(NEI, SCC, by="SCC") 
}
library(ggplot2)

##### 4.Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
coal_related <- NEI_SCC[grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE),]

coal_related_by_year <- aggregate(Emissions ~ year, coal_related, sum)

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot emissions from coal combustion-related sources
png('plot4.png', width=480, height=480)
gg <- ggplot(coal_related_by_year, aes(factor(year),Emissions)) 
gg + geom_bar(stat = "identity") +
  labs(title = "PM2.5 emissions from coal combustion-related sources in the US ", x = "Year", y = "PM2.5 emissions")
dev.off()