## Reading the data
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## Only use data on 2007-02-01 and 2007-02-02
myData <- myData[with(myData, Date=="1/2/2007"|Date=="2/2/2007"), ]

##Construct the plot
png(file="plot1.png", width = 480, height = 480, units = 'px')
hist(myData$Global_active_power, xlab="Global Active Power(kilowatts)", main="Global Active Power", col="red")
dev.off()
