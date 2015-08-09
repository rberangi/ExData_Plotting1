b<- grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE);
c<- read.table(text = b, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

datetime <- strptime(paste(c$Date, c$Time, sep=""), "%d/%m/%Y %H:%M:%S") 
plot(datetime,  c$Sub_metering_1, type = "l",ylab = "Energy submetering", xlab = "",col="black")
lines(datetime,  c$Sub_metering_2, type = "l",ylab = "Energy submetering", xlab = "",col="red")
lines(datetime,  c$Sub_metering_3, type = "l",ylab = "Energy submetering", xlab = "",col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png,filename = "Plot3.png",width = 480, height = 480, units = "px")
dev.off()

