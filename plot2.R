
# get data from data file
# data of file seperated by ;
fileName = "household_power_consumption.txt"
pcData <- read.table(fileName, header = TRUE, colClasses = "character", sep = ";")


# get part of data for two days 
myData <- subset(pcData, Date == "1/2/2007" | Date == "2/2/2007")


# conver the data to making the plot
datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activePower <- as.numeric(myData$Global_active_power)

# plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, activePower, type = "l", xlab = "", ylab = "Active Power (kilowatts)")

# copy scatterplot to png device
dev.copy(png, file = "plot2.png", width = 480, height = 480)

# close the graphic device
dev.off()