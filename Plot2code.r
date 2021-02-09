#plot2 code
fileName <- file("household_power_consumption.txt") # define a fileName for the full data file

# read the data from 2007-02-01 and 2007-02-02
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Converting dates and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(DateTime)

# Open PNG device
png(file = "Plot2.png", width = 480, height = 480, units = "px")

# Generating Plot2
plot(data$Global_active_power ~ data$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")