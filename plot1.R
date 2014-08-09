download.file("http://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",
              destfile = "household_power_consumption.zip")
power.data <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),
                        sep = ";",
                        header = TRUE)

power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")
sub <- subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
a <- paste(as.character(sub$Date), as.character(sub$Time), sep = " ")
b <- strptime(a, format = "%Y-%m-%d %H:%M")
sub$Time <- b

for (i in 3:9) {
     sub[,i] <- as.numeric(as.character(sub[,i]))
}
data <- sub

png("Plot1.png", bg = "white")
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
