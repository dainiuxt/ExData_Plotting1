power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power.data$Date <- as.Date(power.data$Date, format="%d/%m/%Y")
data <- subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
a <- paste(as.character(data$Date), as.character(data$Time), sep = " ")
b <- strptime(a, format = "%Y-%m-%d %H:%M")
data$Time <- b

for (i in 3:9) {
     data[,i] <- as.numeric(as.character(data[,i]))
}

#Plot 3
png("Plot3.png", bg = "white")
plot(data$Time, data$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
plot.xy(xy.coords(data$Time, data$Sub_metering_2), type = "l", col = "red")
plot.xy(xy.coords(data$Time, data$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
