hpc <- read.table("household_power_consumption.txt", head = TRUE, sep = ";")
library(lubridate)
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)
hpc_2days <- subset(hpc, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
hpc_2days$Date_Time <- hpc_2days$Date + hpc_2days$Time
x <- hpc_2days$Date_Time
y <- as.numeric(as.character(hpc_2days$Global_active_power))
png(filename = "plot2.png")
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts")
dev.off()
