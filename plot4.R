hpc <- read.table("household_power_consumption.txt", head = TRUE, sep = ";")
library(lubridate)
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)
hpc_2days <- subset(hpc, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
hpc_2days$Date_Time <- hpc_2days$Date + hpc_2days$Time
x <- hpc_2days$Date_Time
y <- as.numeric(as.character(hpc_2days$Global_active_power))
y1 <- as.numeric(as.character(hpc_2days$Sub_metering_1))
y2 <- as.numeric(as.character(hpc_2days$Sub_metering_2))
y3 <- as.numeric(as.character(hpc_2days$Sub_metering_3))
y4 <- as.numeric(as.character(hpc_2days$Voltage))
y5 <- as.numeric(as.character(hpc_2days$Global_reactive_power))
png(filename = "plot4.png")
par(mfcol = c(2,2))
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")  
plot(x,y1, type = "n", xlab = "", ylab = "Energy sub metering")
points(x, y1, type = "l", pch = "NA", col = "black")
points(x, y2, type = "l", pch = "NA", col = "red")
points(x, y3, type = "l", pch = "NA", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(x, y4, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x, y5, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
       