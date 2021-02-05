##
## Script to create "Global Active Power" x-y plot 
## Reads in data from UCI electric power consumption file
## Extracts data for 2007/2/1 and 2007/2/2
## Plots data to file "plot2.png" 480x480 pixels
##

power <- read.table("household_power_consumption.txt", header=TRUE, 
                    stringsAsFactors=FALSE, sep=";", dec=".")
subpower <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

subpower$Global_active_power <- as.numeric(subpower$Global_active_power)
temp <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- as.POSIXct(temp, format = "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
par(font.lab=2, font.axis=2, pty="m")
with(subpower, plot(Global_active_power ~ DateTime, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)"))
dev.off()
