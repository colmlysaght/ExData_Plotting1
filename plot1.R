##
## Script to create "Global Active Power" histogram plot 
## Reads in data from UCI electric power consumption file
## Extracts data for 2007/2/1 and 2007/2/2
## Plots data to file "plot1.png" 480x480 pixels
##

power <- read.table("household_power_consumption.txt", header=TRUE, 
                    stringsAsFactors=FALSE, sep=";", dec=".")

subpower <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

subpower$Global_active_power <- as.numeric(subpower$Global_active_power)
png("plot1.png", width=480, height=480)
hist(subpower$Global_active_power, col="red", 
              main="Global Active Power", 
              xlab="Global Active Power (kilowatts)")
dev.off()
