## Read power consumption data
setwd("~/_Never Backup/Dropbox/Coursera/Exploratory Data Analysis/Assignment 1")
PowerData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

##Get rid of missing data (marked with ? character)
TempData <- PowerData[PowerData$Global_active_power != '?',]

##Data type transformations
TempData$DateAndTime <- paste(TempData$Date, TempData$Time, sep = " ")
TempData$Date <- as.Date(TempData$Date,format = "%d/%m/%Y")
TempData$DateAndTime <- as.POSIXct(TempData$DateAndTime,format = "%d/%m/%Y %H:%M:%S")
TempData$Global_active_power <- as.numeric(as.character(TempData$Global_active_power))
TempData$Global_reactive_power <- as.numeric(as.character(TempData$Global_reactive_power))
TempData$Voltage <- as.numeric(as.character(TempData$Voltage))
TempData$Sub_metering_1 <- as.numeric(as.character(TempData$Sub_metering_1, length = 3))
TempData$Sub_metering_2 <- as.numeric(as.character(TempData$Sub_metering_2, length = 3))
TempData$Sub_metering_3 <- as.numeric(as.character(TempData$Sub_metering_3, length = 3))

##Get data for 2 selected dates:
PowerDataSubset <- TempData [TempData$Date == '2007-02-01' | TempData$Date == '2007-02-02',] 


##All combined into Png 4:
par(mfrow = c(2,2))
##1 of 4:
plot(PowerDataSubset$Global_active_power ~ PowerDataSubset$DateAndTime, type="n", ylab = "Global Active Power", xlab = "") 
lines(PowerDataSubset$Global_active_power ~ PowerDataSubset$DateAndTime ) 
##2 of 4:
plot(PowerDataSubset$Voltage ~ PowerDataSubset$DateAndTime, type="n", ylab = "Volatage", xlab = "datetime") 
lines(PowerDataSubset$Voltage ~ PowerDataSubset$DateAndTime ) 
##3 of 4:
plot(PowerDataSubset$Sub_metering_1 ~ PowerDataSubset$DateAndTime, type="n", ylab = "Energy sub metering", xlab = "") 
lines(PowerDataSubset$Sub_metering_1 ~ PowerDataSubset$DateAndTime, col = "black") 
lines(PowerDataSubset$Sub_metering_2 ~ PowerDataSubset$DateAndTime, col = "red") 
lines(PowerDataSubset$Sub_metering_3 ~ PowerDataSubset$DateAndTime, col = "blue") 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, cex = 0.7, bty = "n")
##4 of 4:
plot(PowerDataSubset$Global_reactive_power ~ PowerDataSubset$DateAndTime, type="n", ylab = "Global_reactive_power", , xlab = "datetime") 
lines(PowerDataSubset$Global_reactive_power ~ PowerDataSubset$DateAndTime ) 
##Export:
dev.copy(png,'plot4.png')
dev.off()

