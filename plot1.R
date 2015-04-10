library(sqldf)

data <- read.csv.sql('household_power_consumption.txt', 
	sql = 'select * from file where Date in (\'1/2/2007\',\'2/2/2007\')', sep=';')
	
data$Date <- as.POSIXlt(strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S'))

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

hist(data$Global_active_power, col='red', main='Global Active Power', 
	xlab='Global Active Power (kilowatts)')
	
dev.off()


