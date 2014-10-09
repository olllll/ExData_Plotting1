##read table
powerdata<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")

##convert date& Time
powerdata$Time<-strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
powerdata$Date<-as.Date(powerdata$Date, format = "%d/%m/%Y")

##subset the range of dates we need
pwdata.assign<-subset(powerdata, powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02" )

##open the png device
png("plot3.png", height = 480, width = 480)
##we use plot () to draw the graph for the first sub-metering
plot(pwdata.assign$Time, pwdata.assign$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")

##then we overlay the other two Sub-meterings by using the points() function
points(pwdata.assign$Time, pwdata.assign$Sub_metering_2, type = "l", col = "red")
points(pwdata.assign$Time, pwdata.assign$Sub_metering_3, type = "l", col = "blue")

##add a legend
legend("topright", lwd =1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close the device
dev.off()
