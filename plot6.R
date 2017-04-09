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

#####6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
vehicle <- NEI_SCC[grepl("vehicle", NEI_SCC$Short.Name, ignore.case=TRUE),]

vehicle_emissions_by_time <- aggregate(Emissions ~ year + fips, vehicle[vehicle$fips=='24510' | vehicle$fips=='06037',], sum)
vehicle_emissions_by_time$fips[vehicle_emissions_by_time$fips=='24510'] <- 'Baltimore'
vehicle_emissions_by_time$fips[vehicle_emissions_by_time$fips=='06037'] <- 'Los Angeles'

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot emissions from vehicles in Baltimore City and Los Angeles
png('plot6.png', width=480, height=480)
gg <- ggplot(vehicle_emissions_by_time, aes(factor(year),Emissions)) 
gg + facet_grid(. ~ fips) + geom_bar(stat = "identity") +
  labs(title = "PM2.5 emissions from vehicles in Baltimore City and Los Angeles", x = "Year", y = "PM2.5 emissions")
dev.off()