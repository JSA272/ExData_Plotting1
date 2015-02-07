## Construct data.frame datafull from entire .txt file, then extract relevant entries into data
## Create datetime element of data with POSIX formate date/time index
datafull <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors = FALSE)
data <- subset(datafull, datafull$Date == "1/2/2007" | datafull$Date == "2/2/2007")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## Draw plot
png(file = "plot3.png")
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"), lwd = .75)
dev.off()