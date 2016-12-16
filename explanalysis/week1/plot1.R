# Plot1 - Histogram of Global Active Power

# Read whole data file

week1data <- read.table("C:/NotBackedUp/Sanjay/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE) 

# Subset data for Feb 1 and Feb 2, 2007 as required.

subdata <- week1data[as.Date(week1data$"Date", "%d/%m/%Y") %between% c("2007/02/01", "2007/02/02"),]

# Plot histogram using Base graphics

hist(as.numeric(as.character(subdata$"Global_active_power")), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy to PNG device woth required size -

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

# close the PNG device -

dev.off()

