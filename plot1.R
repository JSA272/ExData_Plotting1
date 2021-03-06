## Construct data.frame datafull from entire .txt file, then extract relevant entries into data
## Create datetime element of data with POSIX formate date/time index
datafull <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors = FALSE)
data <- subset(datafull, datafull$Date == "1/2/2007" | datafull$Date == "2/2/2007")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## Draw plot
png(file = "plot1.png")
with(data, hist(Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()