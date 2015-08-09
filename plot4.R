b<- grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE);
c<- read.table(text = b, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

datetime <- strptime(paste(c$Date, c$Time, sep=""), "%d/%m/%Y %H:%M:%S") 
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(datetime,  c$Global_active_power, type = "l",ylab = "Energy submetering", xlab = "",col="black")
plot(datetime,  c$Voltage, type = "l",ylab = "voltage", xlab = "datetime",col="black")
plot(datetime,  c$Sub_metering_1, type = "l",ylab = "Energy submetering", xlab = "",col="black",ylim=c(0,40))
lines(datetime,  c$Sub_metering_2, type = "l",col="red")
lines(datetime,  c$Sub_metering_3, type = "l",col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty = "n")
plot(datetime,  c$Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab = "datetime",col="black")


dev.copy(png,filename = "Plot4.png",width = 480, height = 480, units = "px")
dev.off()

