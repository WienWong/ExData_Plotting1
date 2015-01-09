

dataFile <- "household_power_consumption.txt"

library(data.table)

DF <- read.csv(dataFile, sep=";", stringsAsFactors=FALSE,
               na.strings = c("?", ""))

# sub-set the Date
DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%d/%m/%Y %H:%M:%S") 

plot(DF$DateTime, DF$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
