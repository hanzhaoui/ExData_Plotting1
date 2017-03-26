#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#              destfile = "power.zip")
#unzip("power.zip")

data <- read.table("household_power_consumption.txt", 
                   sep = ";",header = T,
                   colClasses = c("character", "character", rep("numeric", 7)),
                   na.strings = "?")

data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_sub$dt <- strptime(paste(data_sub$Date, data_sub$Time), "%d/%m/%Y %H:%M:%S")
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")

with(data_sub, plot(dt, Sub_metering_1,
                    type = "line",
                    xlab="",
                    ylab="Energy sub metering"))
with(data_sub, lines(dt, Sub_metering_2, col = "red"))
with(data_sub, lines(dt, Sub_metering_3, col = "blue"))

legend("topright", col = c("black", "red", "blue"), 
                           legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
                           lty = c(1, 1, 1), cex = 0.8)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()