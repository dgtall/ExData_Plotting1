library(sqldf)

data <- read.csv.sql('household_power_consumption.txt', 
	sql = 'select * from file where Date in (\'1/2/2007\',\'2/2/2007\')', sep=';')
	
data$Date <- as.POSIXlt(strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S'))

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
	
par(mfrow=c(2,2))

plot(data$Date, data$Global_active_power, ylab = 'Global Active Power (kilowatts)', type='l',xlab='')
	
plot(data$Date, data$Voltage, ylab = 'Voltage', xlab='datetime',type='l')
	
plot(data$Date, data$Sub_metering_1, ylab = 'Energy sub metering', type='l', xlab='')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	lty=c(1,1,1),col = c('black','red','blue'))
lines(data$Date, data$Sub_metering_2, col='red')
lines(data$Date, data$Sub_metering_3, col='blue')

plot(data$Date, data$Global_reactive_power, ylab = 'Global_reactive_power', 
	xlab='datetime', type='l')
	
dev.off()
