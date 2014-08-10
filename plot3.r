## Reading the data
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## Only use data on 2007-02-01 and 2007-02-02
myData2 <- myData[with(myData, Date=="1/2/2007"|Date=="2/2/2007"), ]

## Only use sub meter data
myData3 <- myData2[,7:9]

##Construct the plot
png(file="plot3.png", width = 480, height = 480, units = 'px')

dateTime <- strptime(paste(myData2$Date,myData2$Time), format="%d/%m/%Y %H:%M:%S")

# set up the plot 
xrange <- range(dateTime)
yrange <- range(myData3)
plot(xrange, yrange, type="n", xlab="", ylab="Energy sub metering" ) 
colors <- c("black","red", "blue") 

# add lines 
for (i in 1:3) {    
  lines(dateTime, myData3[,i], col=colors[i], lty="solid") 
} 

# add a legend 
legend("topright", legend = names(myData2)[7:9], lty="solid", cex=0.8, col=colors)

dev.off()