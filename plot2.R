library(sqldf)

data <- read.csv.sql('household_power_consumption.txt', 
	sql = 'select * from file where Date in (\'1/2/2007\',\'2/2/2007\')', sep=';')
	
data$Date <- as.POSIXlt(strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S'))

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(data$Date, data$Global_active_power, ylab = 'Global Active Power (kilowatts)', 
	xlab='datetime', type='l')
	
dev.off()

