#File located in the Data sub-folder
fileName <- "./data/household_power_consumption.txt"

#Read in all the data in the file
allData <- read.table(fileName, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

#Subset the data to get data for 1/2/2007 and 2/2/2007
subData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#Remove the full dataset from the environment to release memory
rm(allData)

#Get global active power
globalActivePower <- as.numeric(subData$Global_active_power)

#Set device to be png, and set width and height
png("plot1.png", width=480, height=480)

#Plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turn off the device
dev.off()
