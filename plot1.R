
# get data from data file
# data of file seperated by ;
fileName = "household_power_consumption.txt"
pcData <- read.table(fileName, header = TRUE, sep = ";")


# get part of data for two days 
myData <- subset(pcData, Date == "1/2/2007" | Date == "2/2/2007")

# convert factor to charater for processing data
myData$Global_active_power = as.character(myData$Global_active_power)

# plotting histogram with some options(title, label of x-axe)
hist(as.numeric(myData$Global_active_power), col = "red", main = "Global Activity Power", xlab = "Global Active Power (kilowatts)")

# copy historam to png device
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# close the graphic device
dev.off()