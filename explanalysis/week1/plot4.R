# Plot4 - 4 plots on same canvas in 2 rows and 2 columns

# Read whole data file

week1data <- read.table("C:/NotBackedUp/Sanjay/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE) 

# Subset data for Feb 1 and Feb 2, 2007 as required.

subdata <- week1data[as.Date(week1data$"Date", "%d/%m/%Y") %between% c("2007/02/01", "2007/02/02"),]

# Set parameter with 2 rows and 2 columns

par(mfrow=c(2,2))

## 1st plot to go in Row = 1 and Column = 1 -

with(subdata, plot(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Global_active_power")), type = "l", xlab = " ", ylab = "Global Active Power"))


## 2nd plot to go in Row = 1 and Column = 2 -

with(subdata, plot(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Voltage")), type = "l", xlab = "datetime", ylab = "Voltage"))

## 3rd plot to go in Row = 2 and Column = 1 -

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

## 4th plot to go in Row = 2 and Column = 2 -

with(subdata, plot(strptime(paste(subdata$"Date", subdata$"Time"), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(subdata$"Global_reactive_power")), type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


# Copy to PNG device woth required size -

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")


# close the PNG device -

dev.off()





