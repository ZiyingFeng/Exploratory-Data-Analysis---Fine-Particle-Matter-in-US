NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Read the NEI and SCC file

sum_year <- tapply(NEI$Emissions, NEI$year, sum)
# Total emissions in the US in each year

plot(c(1999,2002,2005,2008), sum_year, xlab = "Year", ylab = "Total PM25 Emissions", xaxt = "n")
axis(side = 1, at = seq(1999, 2008, 3))
