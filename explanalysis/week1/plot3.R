# Plot3 - Enery sub metering (sub_metering_1, sub_metering_2 and sub_metering_3) on Y axis and Day/Time on X axis

# Read whole data file

week1data <- read.table("C:/NotBackedUp/Sanjay/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE) 

# Subset data for Feb 1 and Feb 2, 2007 as required.

subdata <- week1data[as.Date(week1data$"Date", "%d/%m/%Y") %between% c("2007/02/01", "2007/02/02"),]


# Plot Base graphics with annotation

# Blank canvas
with(subdata, plot(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Sub_metering_1")), type = "n", xlab = " ", ylab = "Energy sub metering"))

#Add Sub_metering_1 points

points(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Sub_metering_1")), type = "l")

#Add Sub_metering_2 points

points(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Sub_metering_2")), type = "l", col = "red")

#Add Sub_metering_3 points

points(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"), subdata$"Sub_metering_3", type = "l", col = "blue")

# Add Legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Copy to PNG device woth required size -

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")


# close the PNG device -

dev.off()





