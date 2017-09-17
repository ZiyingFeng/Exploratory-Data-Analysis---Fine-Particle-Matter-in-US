NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Read the NEI and SCC file

SCC1 <- SCC
SCC1$Short.Name <- as.character(SCC1$Short.Name)
SCC1$SCC <- as.character(SCC1$SCC)
# Convert the factor to character in SCC

SCC_coal_comb <- SCC1[grep("Coal.+Comb", SCC1$Short.Name),]
# Find the coal combustion related source SCC 

NEI_coal_comb <- NEI[NEI$SCC %in% SCC_coal_comb$SCC,]
# Subset the coal combustion related source data

NEI_coal_comb_sum <- tapply(NEI_coal_comb$Emissions, NEI_coal_comb$year, sum, na.rm = TRUE)
plot(c(1999,2002,2005,2008), NEI_coal_comb_sum, xlab = "Year", ylab = "Coal Combustion-Related Source Emissions", xaxt = "n")
axis(side = 1, at = seq(1999, 2008, 3))