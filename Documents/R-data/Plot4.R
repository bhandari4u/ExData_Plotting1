## set the working directory where data file is located
## read data file
## combine date and time columns and convert format of the new field to a date foramt 
## reduce the dataset 
## specify file name and related attributes 
## set global parameters to show 4 grpahs in 2X2 format
## generate grpahs
## close device
setwd("C:/Users/sunil/Documents/R-data")
householddata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
householddata$Datetime <- strptime(paste(householddata$Date,householddata$Time),"%d/%m/%Y %H:%M:%S")
selectedhousehold <- subset(householddata, Date== "1/2/2007"|Date== "2/2/2007")
png(filename="Plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(selectedhousehold$Datetime, selectedhousehold$Global_active_power, type="l")
plot(selectedhousehold$Datetime, selectedhousehold$Voltage, type="l")
with(selectedhousehold, plot(Datetime, Sub_metering_1, type="n", ylab = "Energy sub metering"))
lines(selectedhousehold$Datetime, selectedhousehold$Sub_metering_1, type="l")
lines(selectedhousehold$Datetime, selectedhousehold$Sub_metering_2, type="l", col="red")
lines(selectedhousehold$Datetime, selectedhousehold$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "-", col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(selectedhousehold$Datetime, selectedhousehold$Global_reactive_power, type="l")
dev.off()