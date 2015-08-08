## set the working directory where data file is located
## read data file
## combine date and time columns and convert format of the new field to a date foramt 
## reduce the dataset 
## specify file name and related attributes 
## plot graph
## close device
setwd("C:/Users/sunil/Documents/R-data")
householddata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
householddata$Datetime <- strptime(paste(householddata$Date,householddata$Time),"%d/%m/%Y %H:%M:%S")
selectedhousehold <- subset(householddata, Date== "1/2/2007"|Date== "2/2/2007")
png(filename="Plot2.png", width=480, height=480)
plot(selectedhousehold$Datetime, selectedhousehold$Global_active_power, type="l", ylab = "Global Active Power")
dev.off()