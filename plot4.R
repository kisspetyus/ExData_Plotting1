##Read the data
elec <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

##Subset the data
elec$Dt <- as.Date(elec$Date, "%d/%m/%Y")
kn <- subset(elec, elec$Dt>=as.Date("2007-02-01"))
kn <- subset(kn, kn$Dt<=as.Date("2007-02-02"))

##Creating a new attribute (datd) containing time
kn$dat <- paste(kn$Date,kn$Time)
kn$datd <- strptime(kn$dat,"%d/%m/%Y %H:%M:%S")


##Plot4
par(mfrow=c(2,2))
plot(kn$datd,kn$Global_active_power,"l",ylab="Global Active Power",xlab="")
plot(kn$datd,kn$Voltage,"l",ylab="Voltage",xlab="datetime")
plot(kn$datd,kn$Sub_metering_1,"l", ylab="Energy sub metering",xlab="")
points(kn$datd,kn$Sub_metering_2,"l",col="red")
points(kn$datd,kn$Sub_metering_3,"l",col="blue")
legend("topright",pch=c("l","l","l"),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(kn$datd,kn$Global_reactive_power,"l",ylab="Global_reactive_power", xlab="datetime")
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()