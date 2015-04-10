##Read the data
elec <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

##Subset the data
elec$Dt <- as.Date(elec$Date, "%d/%m/%Y")
kn <- subset(elec, elec$Dt>=as.Date("2007-02-01"))
kn <- subset(kn, kn$Dt<=as.Date("2007-02-02"))

##Creating a new attribute (datd) containing time
knw$dat <- paste(knw$Date,knw$Time)
knw$datd <- strptime(knw$dat,"%d/%m/%Y %H:%M:%S")


##Plot2
par(mfrow=c(1,1))
plot(knw$datd,knw$Global_active_power,"l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()