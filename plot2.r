## Reading the data
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## Only use data on 2007-02-01 and 2007-02-02
myData <- myData[with(myData, Date=="1/2/2007"|Date=="2/2/2007"), ]

##Construct the plot
png(file="plot2.png", width = 480, height = 480, units = 'px')

dateTime <- strptime(paste(myData$Date,myData$Time), format="%d/%m/%Y %H:%M:%S")
with(myData, plot(dateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

#interesting labling method
##axis(1, at=c(1,nrow(myData2)/2,nrow(myData2)),labels=c("Thu","Fri","Sat"))

dev.off()