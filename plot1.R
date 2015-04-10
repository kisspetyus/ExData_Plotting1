##Read the data
elec <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

##Subset the data
elec$Dt <- as.Date(elec$Date, "%d/%m/%Y")
kn <- subset(elec, elec$Dt>=as.Date("2007-02-01"))
kn <- subset(kn, kn$Dt<=as.Date("2007-02-02"))

##Creating a new attribute (datd) containing time
knw$dat <- paste(knw$Date,knw$Time)
knw$datd <- strptime(knw$dat,"%d/%m/%Y %H:%M:%S")


##Plot1
par(mfrow=c(1,1))
hist(kn$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()