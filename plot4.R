## plot 4 ##
# set working directory
setwd("YourWorkingDirectoryHere")
# read and subset the data set for the dates 2007-02-01 and 2007-02-02
epc <- read.table(".../household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
epc <- subset(pro, pro$Date == "1/2/2007" | pro$Date == "2/2/2007")
# load libraries 
library(lubridate) 
library(dplyr)
# convert the Date and Time variables, and select the variables that will be useful for the project
epc <- mutate(pro, date_time = dmy_hms(paste(Date, Time))) %>% 
        select(date_time, Global_active_power, Global_reactive_power,  Voltage, Global_intensity, 
               Sub_metering_1, Sub_metering_2, Sub_metering_3)
# construct the plot
par(mfrow = c(2, 2))
plot(epc$date_time, epc$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(epc$date_time, epc$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(epc$date_time, epc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(epc$date_time, epc$Sub_metering_2, col = "red")
lines(epc$date_time, epc$Sub_metering_3, col = "blue")
legend("topright", pch = "-", lwd = 3, bty = "n", cex = 0.8, inset = 0.08, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(epc$date_time, epc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
# save it to a PNG file
dev.copy(png, file = ".../plot4.png")
dev.off()