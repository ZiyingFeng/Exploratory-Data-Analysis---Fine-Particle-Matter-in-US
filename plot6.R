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

data_LA <- subset(NEI, NEI$fips == "06037")
# Data in Los Angeles
data_LA_motorVehicle <- data_LA[data_LA$SCC %in% SCC_motorVehicle$SCC,]
# Data related to motor vehicle source in Los Angeles
data_LA_motorVehicle_sum <- tapply(data_LA_motorVehicle$Emissions, data_LA_motorVehicle$year, sum, na.rm = TRUE)
# Total Emissions in each year in Los Angeles for the motor vehicle related source

plot(c(1999,2002,2005,2008), data_baltimore_motorVehicle_sum, xlab = "Year", ylab = "Total PM25 Emissions", xaxt = "n", type = "b", col = "blue", lwd = 2, pch = 16, bg = "blue", ylim = c(20, 1500))
# Base plot the Baltimore city data and set the y limit from 20 to 1500
points(c(1999,2002,2005,2008), data_LA_motorVehicle_sum, xaxt = "n", type = "b", col = "red", lwd = 2, pch = 15)
# Add the Los Angeles data to the plot
legend("topright", pch = c(16,15), col = c("blue", "red"), lwd = 2, legend = c("Baltimore", "Los Angeles"))
# Add the legend to the plot

