## Reads in data from UCI electric power consumption file
## Extracts data for 2007/2/1 and 2007/2/2
## Plots data to file "plot4.png" 480x480 pixels
##

power <- read.table("household_power_consumption.txt", header=TRUE, 
                    stringsAsFactors=FALSE, sep=";", dec=".")
subpower <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

subpower$Global_active_power <- as.numeric(subpower$Global_active_power)
subpower$Global_reactive_power <- as.numeric(subpower$Global_reactive_power)
temp <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- as.POSIXct(temp, format = "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0), pty="m")
with(subpower, 
     {plot(Global_active_power ~ DateTime, type="l", xlab="", 
           ylab="Global Active Power")
       
      plot(Voltage ~ DateTime, type="l", xlab="datetime", ylab="Voltage")
       
      plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")
      lines(Sub_metering_2 ~ DateTime, col="red")
      lines(Sub_metering_3 ~ DateTime, col="blue")
      legend ("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                                   "Sub_metering_3"),
              col=c("black", "red", "blue"),
              lty=1)
      
      plot(Global_reactive_power ~ DateTime, type="l", xlab="datetime", 
           ylab="Global_reactive_power")
       
     })
dev.off()