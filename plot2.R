## plot 2 ##
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
plot(epc$date_time, epc$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
# save it to a PNG file
dev.copy(png, file = ".../plot2.png")
dev.off()