
library(sqldf)

data <- read.csv.sql('household_power_consumption.txt', 
	sql = 'select * from file where Date in (\'1/2/2007\',\'2/2/2007\')', sep=';')
	
data$Date <- as.POSIXlt(strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S'))

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(data$Date, data$Sub_metering_1, ylab = 'Energy sub metering', xlab='datetime', type='l')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	lty=c(1,1,1),col = c('black','red','blue'))
lines(data$Date, data$Sub_metering_2, col='red')
lines(data$Date, data$Sub_metering_3, col='blue')
	
dev.off()

