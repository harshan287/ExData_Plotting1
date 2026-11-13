data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?",
                   stringsAsFactors=FALSE,
                   colClasses=c("character","character",rep("numeric",7)),
                   nrows=300000)

data$DateTime <- strptime(paste(data$Date,data$Time),
                          format="%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") &
                 Date <= as.Date("2007-02-02"))

png("plot3.png", width=480, height=480)

plot(data$DateTime, data$Sub_metering_1,
     type="l", col="black",
     xlab="", ylab="Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1, bty="n")

dev.off()
