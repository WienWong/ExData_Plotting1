
dataFile <- "household_power_consumption.txt"

library(data.table)

DF <- read.csv(dataFile, sep = ";", stringsAsFactors = FALSE,
               na.strings = c("?", ""))

# sub-set the Date
DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S") 

png("plot4.png", pointsize = 12, width = 480, height = 480)

par(mfrow = c(2, 2)) 


with(DF, {
    plot(Global_active_power ~ DateTime, type = "l", 
         ylab = "Global Active Power", xlab = "")
    
    plot(Voltage ~ DateTime, type = "l", 
         ylab = "Voltage", xlab = "datetime")
    
    plot(Sub_metering_1 ~ DateTime, type = "l", 
         ylab = "Energy sub metering", xlab = "")
    
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
    
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Global_reactive_power ~ DateTime, type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
})

dev.off()
