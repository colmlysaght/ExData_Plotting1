##
## Script to create "Energy sub metering" x-y plot 
## Reads in data from UCI electric power consumption file
## Extracts data for 2007/2/1 and 2007/2/2
## Plots data to file "plot3.png" 480x480 pixels
##

power <- read.table("household_power_consumption.txt", header=TRUE, 
                    stringsAsFactors=FALSE, sep=";", dec=".")
subpower <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

temp <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- as.POSIXct(temp, format = "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
par(font.lab=2, font.axis=2, pty="s")
with(subpower, 
     {plot(Sub_metering_1 ~ DateTime, type="l", xlab="", 
                    ylab="Energy sub metering")
       lines(Sub_metering_2 ~ DateTime, col="red")
       lines(Sub_metering_3 ~ DateTime, col="blue")
       legend("topright", legend=c("Sub_metering_1", 
                                   "Sub_metering_2",
                                   "Sub_metering_3"),
                           col = c("black", "red", "blue"),
                           lty = 1)
     })
dev.off()