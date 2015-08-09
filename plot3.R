a<- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?");
with(a,hist(Global_active_power))
b<- grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE);
c<- read.table(text = b, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

datetime <- strptime(paste(c$Date, c$Time, sep=""), "%d/%m/%Y %H:%M:%S") 

plot(datetime, c$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")


dev.copy(png,filename = "Plot2.png",width = 480, height = 480, units = "px")
dev.off()
