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

#####5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
vehicle <- NEI_SCC[grepl("vehicle", NEI_SCC$Short.Name, ignore.case=TRUE),]

vehicle_emissions_by_time <- aggregate(Emissions ~ year, vehicle[vehicle$fips=='24510',], sum)

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot emissions from vehicles in Baltimore City
png('plot5.png', width=480, height=480)
gg <- ggplot(vehicle_emissions_by_time, aes(factor(year),Emissions)) 
gg + geom_bar(stat = "identity") +
  labs(title = "PM2.5 emissions from vehicles in Baltimore City", x = "Year", y = "PM2.5 emissions")
dev.off()