#plot4 code
fileName <- file("household_power_consumption.txt") # define a fileName for the full data file

# read the data from 2007-02-01 and 2007-02-02
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Converting dates and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(DateTime)

# Open PNG device
png(file = "Plot4.png", width = 480, height = 480, units = "px")

## Generating Plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0)) # define a place for th four figures

with(data, {
  plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})