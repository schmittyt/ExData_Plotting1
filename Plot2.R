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


##Plot 2
plot(PowerDataSubset$Global_active_power ~ PowerDataSubset$DateAndTime, type="n", ylab = "Global Active Power (kilowatts)", xlab = "") 
lines(PowerDataSubset$Global_active_power ~ PowerDataSubset$DateAndTime ) 
dev.copy(png,'plot2.png')
dev.off()

