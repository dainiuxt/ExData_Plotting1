power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")
data <- subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
a <- paste(as.character(data$Date), as.character(data$Time), sep = " ")
b <- strptime(a, format = "%Y-%m-%d %H:%M")
data$Time <- b
for (i in 3:9) {
     data[,i] <- as.numeric(as.character(data[,i]))
}

#Plot 4
png("Plot4.png", bg = "white")
par(mfrow = c(2,2))
plot(data$Time, data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
plot(data$Time, data$Voltage, ylab = "Voltage", type = "l", xlab = "datetime")
plot(data$Time, data$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
plot.xy(xy.coords(data$Time, data$Sub_metering_2), type = "l", col = "red")
plot.xy(xy.coords(data$Time, data$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))
plot(data$Time,
     data$Global_reactive_power,
     ylab = "Global_reactive_power",
     type = "l",
     xlab = "datetime")
dev.off()
