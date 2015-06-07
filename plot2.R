data<-read.csv('household_power_consumption.txt',sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

Date1<-paste(data$Date,data$Time)
Date2<-strptime(Date1,"%d/%m/%Y %H:%M:%S")

data1<-list(DateTime=Date2,Global_active_power=data$Global_active_power,Global_reactive_power=data$Global_reactive_power,Voltage=data$Voltage,Global_intensity=data$Global_intensity,Sub_metering_1=data$Sub_metering_1,Sub_metering_2=data$Sub_metering_2,Sub_metering_3=data$Sub_metering_3)

MinT<-strptime("2007/01/31 23:59:59","%Y/%m/%d %H:%M:%S")

MaxT<-strptime("2007/02/03 00:00:01","%Y/%m/%d %H:%M:%S")

z<-data1$DateTime[data1$DateTime > MinT & data1$DateTime < MaxT]
v<-data1$Global_active_power[data1$DateTime > MinT & data1$DateTime < MaxT]

png(filename="plot2.png",width = 480, height = 480)

plot(z,v,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()