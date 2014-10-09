##read table
powerdata<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")

##convert date& Time
powerdata$Time<-strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
powerdata$Date<-as.Date(powerdata$Date, format = "%d/%m/%Y")

##subset the range of dates we need
pwdata.assign<-subset(powerdata, powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02" )


##convert the variable to numeric
pwdata.assign$Global_active_power<-as.numeric(pwdata.assign$Global_active_power)

##plot the graph
plot(pwdata.assign$Time, pwdata.assign$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


##copy it to a png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)

##close the device
dev.off()


