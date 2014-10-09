##read table
powerdata<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")

##convert date& Time
powerdata$Time<-strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
powerdata$Date<-as.Date(powerdata$Date, format = "%d/%m/%Y")

##subset the range of dates we need
pwdata.assign<-subset(powerdata, powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02" )

##open a png device
png ("plot4.png", height = 480, width = 480)

##we need to plot 4 graphs. We set the ordering row-wise
par(mfrow = c(2,2))

## plot #1
plot(pwdata.assign$Time, pwdata.assign$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## plot #2
plot(pwdata.assign$Time, pwdata.assign$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## plot #3
plot(pwdata.assign$Time, pwdata.assign$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(pwdata.assign$Time, pwdata.assign$Sub_metering_2, type = "l", col = "red")
points(pwdata.assign$Time, pwdata.assign$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd =1, bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot #4
plot(pwdata.assign$Time, pwdata.assign$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")


##close the device
dev.off()
