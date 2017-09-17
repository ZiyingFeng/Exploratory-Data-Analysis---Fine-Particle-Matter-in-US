NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Read the NEI and SCC file

data_baltimore <- subset(NEI, NEI$fips == "24510")
# Data in Baltimore city

sum_year_baltimore <- tapply(data_baltimore$Emissions, data_baltimore$year, sum)
# Total emissions in Baltimore city each year

plot(c(1999,2002,2005,2008), sum_year_baltimore, xlab = "Year", ylab = "Total PM25 Emissions in Baltimore", xaxt = "n")
axis(side=1, at = seq(1999, 2008, 3))
