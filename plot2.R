power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")
data <- subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
a <- paste(as.character(data$Date), as.character(data$Time), sep = " ")
b <- strptime(a, format = "%Y-%m-%d %H:%M")
data$Time <- b
for (i in 3:9) {
     data[,i] <- as.numeric(as.character(data[,i]))
}
#Plot 2
png("Plot2.png", bg = "white")
plot(data$Time,
     data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     type = "l",
     xlab = "")
dev.off()
