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

png("plot2.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
