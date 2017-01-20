
# get data from data file
# data of file seperated by ;
fileName = "household_power_consumption.txt"
pcData <- read.table(fileName, header = TRUE, na.strings = "?", colClasses = "character", sep = ";")

# --------------------------------
# get part of data for two days 
# --------------------------------
myData <- subset(pcData, Date == "1/2/2007" | Date == "2/2/2007")


# conver the datetime data to making the plot (x-axis)
datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# divide screen to 2 X 2
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# --------------------------------
# 1. plotting the 1st scatterplot
# --------------------------------
## 1) convert the value of y-axis
globalActivePower <- as.numeric(myData$Global_active_power)


## 2) plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power")

# --------------------------------
# 2. plotting the 1st scatterplot
# --------------------------------
## 1) convert the value of y-axis
voltage <- as.numeric(myData$Voltage)


## 2) plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# --------------------------------
# 3.plotting the 3rd scatterplot
# --------------------------------
## 1) convert the value of y-axis

subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

## 2) plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")


## 3) display the legend options
legend("topright", lty = 1, lwd = 1, bty="n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))


# --------------------------------
# 3.plotting the 4th scatterplot
# --------------------------------
## 1) convert the value of y-axis
globalReactivePower <- as.numeric(myData$Global_reactive_power)

## 2) plotting scatterplot with some options(type: line, label of y-axi)
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# copy scatterplot to png device
dev.copy(png, file = "plot4.png", width = 480, height = 480)

# close the graphic device
dev.off()
