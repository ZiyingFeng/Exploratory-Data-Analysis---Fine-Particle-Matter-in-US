NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Read the NEI and SCC file

library(ggplot2)
library(tidyr)

data_baltimore <- subset(NEI, NEI$fips == "24510")
# Data in Baltimore city

data_baltimore_type <- split(data_baltimore, data_baltimore$type)
# Split the Baltimore city data by type
data_baltimore_type_sum <- lapply(data_baltimore_type, function(x) tapply(x$Emissions, x$year, sum))
# Sum the Emissions in each year for the splitted Baltimore city data

df <- data.frame(data_baltimore_type_sum)
df <- gather(df, type, Emissions, -year)
qplot(year, Emissions, data = df, color = type, facets = .~type)