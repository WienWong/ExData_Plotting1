



dataFile <- "household_power_consumption.txt"

library(data.table)

DF <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE,
               na.strings = c("?", ""))

# sub-set the Date
DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%d/%m/%Y %H:%M:%S") 

png("plot3.png", pointsize=12, width=480, height=480)

# plot(DF$DateTime, DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

with(DF, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
     legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
