# Load the data
setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/00_Data")
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
SCC <- readRDS("Source_Classification_Code.rds")
}

##### 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
emissions_by_year <- aggregate(Emissions ~ year, NEI[NEI$fips=='24510',], sum)

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot emissions in Baltimore City by type over time
png('plot2.png', width=480, height=480)
barplot(height = emissions_by_year$Emissions, names.arg = emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 emissions", main="PM2.5 emissions in Baltimore City over time")
dev.off()


