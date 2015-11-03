#File located in the Data sub-folder
fileName <- "./data/household_power_consumption.txt"

#Read in all the data in the file
allData <- read.table(fileName, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

#Subset the data to get data for 1/2/2007 and 2/2/2007
subData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#Remove the full dataset from the environment to release memory
rm(allData)

#Convert the Date and Time variables to Date/Time classes 
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Get all the data required for the plots
submetering1 <- as.numeric(subData$Sub_metering_1)
submetering2 <- as.numeric(subData$Sub_metering_2)
submetering3 <- as.numeric(subData$Sub_metering_3)
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

#Set the graph size
png("plot4.png", width=480, height=480)

#Set the layout to be 2x2
par(mfrow = c(2, 2)) 

#First graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#Second graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Third graph
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering")
#Add lines
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
#Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", col=c("black", "red", "blue"))

#Fourth graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Turn off the device
dev.off()
