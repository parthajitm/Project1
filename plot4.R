data<-read.csv('household_power_consumption.txt',sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

Date1<-paste(data$Date,data$Time)
Date2<-strptime(Date1,"%d/%m/%Y %H:%M:%S")

data1<-list(DateTime=Date2,Global_active_power=data$Global_active_power,Global_reactive_power=data$Global_reactive_power,Voltage=data$Voltage,Global_intensity=data$Global_intensity,Sub_metering_1=data$Sub_metering_1,Sub_metering_2=data$Sub_metering_2,Sub_metering_3=data$Sub_metering_3)

MinT<-strptime("2007/01/31 23:59:59","%Y/%m/%d %H:%M:%S")

MaxT<-strptime("2007/02/03 00:00:01","%Y/%m/%d %H:%M:%S")

z<-data1$DateTime[data1$DateTime > MinT & data1$DateTime < MaxT]
v<-data1$Global_active_power[data1$DateTime > MinT & data1$DateTime < MaxT]
s1<-data$Sub_metering_1[data1$DateTime > MinT & data1$DateTime < MaxT]
s2<-data$Sub_metering_2[data1$DateTime > MinT & data1$DateTime < MaxT]
s3<-data$Sub_metering_3[data1$DateTime > MinT & data1$DateTime < MaxT]
vl<-data1$Voltage[data1$DateTime > MinT & data1$DateTime < MaxT]
vl<-data1$Voltage[data1$DateTime > MinT & data1$DateTime < MaxT]

png(filename="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

plot(z,v,type="l",ylab="Global Active Power",xlab="")

plot(z,vl,type="l",ylab="Voltage",xlab="datetime")

plot(z,s1,type="n",ylab="Energy sub metering",xlab="")
lines(z,s1,col="black",type="l")
lines(z,s2,col="red",type="l")
lines(z,s3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))

plot(z,grp,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()


