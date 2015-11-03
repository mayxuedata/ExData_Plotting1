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

#Get sub metering data
submetering1 <- as.numeric(subData$Sub_metering_1)
submetering2 <- as.numeric(subData$Sub_metering_2)
submetering3 <- as.numeric(subData$Sub_metering_3)

#Plot the graph
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering")

#Add lines for submetering 2 and 3
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")

#Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#Turn off the device
dev.off()
