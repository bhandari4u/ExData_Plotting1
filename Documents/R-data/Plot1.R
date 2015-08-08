## set the working directory where data file is located
setwd("C:/Users/sunil/Documents/R-data")
## read data file
householddata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
## combine date and time columns and convert format of the new field to a date foramt 
householddata$Datetime <- strptime(paste(householddata$Date,householddata$Time),"%d/%m/%Y %H:%M:%S")
## reduce the dataset 
selectedhousehold <- subset(householddata, Date== "1/2/2007"|Date== "2/2/2007")
## specify file name and related attributes 
png(filename="Plot1.png", width=480, height=480)
## generate histogram
hist(selectedhousehold$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)")
## set grpah title
title(main = "Global Active Power")
## close device
dev.off()