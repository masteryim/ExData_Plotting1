
# get data from data file
# data of file seperated by ;
fileName = "household_power_consumption.txt"
pcData <- read.table(fileName, header = TRUE, colClasses = "character", sep = ";")


# get part of data for two days 
myData <- subset(pcData, Date == "1/2/2007" | Date == "2/2/2007")


# conver the data to making the plot
datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

# plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")

# display the legend options
legend("topright", lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# copy scatterplot to png device
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# close the graphic device
dev.off()