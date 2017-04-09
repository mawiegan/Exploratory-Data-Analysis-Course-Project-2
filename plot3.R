# Load the data
setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/00_Data")
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
SCC <- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)

##### 3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?
emissions_by_year_and_type <- aggregate(Emissions ~ year + type, NEI[NEI$fips=='24510',], sum)

setwd("D:/Users/mwiegand/Documents/Training/Coursera/4_Exploratory Data Analysis/Projects/Final Assignment/01_Code")
# Plot emissions in Baltimore City by type over time
png('plot3.png', width=480, height=480)
gg <- ggplot(emissions_by_year_and_type, aes(year, Emissions, color=type)) 
gg + geom_point() + geom_line() + 
              labs(title = "PM2.5 emissions in Baltimore City by type over time", x = "Year", y = "PM2.5 emissions") +
              theme(legend.title=element_blank())
dev.off()

