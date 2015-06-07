data<-read.csv('household_power_consumption.txt',sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

x<-c(data$Global_active_power[as.Date(data$Date,"%d/%m/%Y")==as.Date("2007/02/01","%Y/%m/%d")],data$Global_active_power[as.Date(data$Date,"%d/%m/%Y")==as.Date("2007/02/02","%Y/%m/%d")])

png(filename="plot1.png",width = 480, height = 480)

hist(x,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

dev.off()
