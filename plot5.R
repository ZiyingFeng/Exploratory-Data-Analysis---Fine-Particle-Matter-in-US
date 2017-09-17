NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Read the NEI and SCC file

SCC1 <- SCC
SCC1$Short.Name <- as.character(SCC1$Short.Name)
SCC1$SCC <- as.character(SCC1$SCC)
# Convert the factor to character in SCC
SCC_motorVehicle <- SCC1[grep("Vehicles", SCC1$Short.Name),]
# Find the motor vehicle source SCC 

data_baltimore <- subset(NEI, NEI$fips == "24510")
# Data in Baltimore city
data_baltimore_motorVehicle <- data_baltimore[data_baltimore$SCC %in% SCC_motorVehicle$SCC,]
# Data related to motor vehicle source in Baltimore city

data_baltimore_motorVehicle_sum <- tapply(data_baltimore_motorVehicle$Emissions, data_baltimore_motorVehicle$year, sum, na.rm = TRUE)
# Total Emissions in each year in Baltimore city for the motor vehicle related source

plot(c(1999,2002,2005,2008), data_baltimore_motorVehicle_sum, xlab = "Year", ylab = "Total PM25 Emissions", xaxt = "n")
axis(side = 1, at = seq(1999, 2008, 3))
