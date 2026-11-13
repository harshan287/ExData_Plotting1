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

png("plot4.png", width=480, height=480)

par(mfrow=c(2,1))

par(mar=c(0,4,2,2))
plot(data$DateTime, data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

par(mar=c(4,4,2,2))
plot(data$DateTime, data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

dev.off()
