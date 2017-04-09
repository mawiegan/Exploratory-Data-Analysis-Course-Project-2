# Load the data
setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/00_Data")
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
SCC <- readRDS("Source_Classification_Code.rds")
}

##### 1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Aggregate pollutions for each year
emissions_by_year <- aggregate(Emissions ~ year, NEI, sum)

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot total emissions over time
png('plot1.png', width=480, height=480)
barplot(height = emissions_by_year$Emissions, names.arg = emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 emissions", main="PM2.5 emissions in the US over time")
dev.off()


