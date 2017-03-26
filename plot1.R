download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "power.zip")
unzip("power.zip")

data <- read.table("household_power_consumption.txt", 
                   sep = ";",header = T,
                   colClasses = c("character", "character", rep("numeric", 7)),
                   na.strings = "?")

data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#The following two lines of codes are not needed for Plot 1
#data_sub$dt <- strptime(paste(data_sub$Date, data_sub$Time), "%d/%m/%Y %H:%M:%S")
#data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")

hist(data_sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Adtive Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
