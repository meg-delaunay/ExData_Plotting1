#data <- read.csv("household_power_consumption.txt", sep=";")
#data_on_dates <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]
#rm(data)

png('plot3.png')

dt_combo <- paste(data_on_dates$Date, data_on_dates$Time)
dt_asDate <- strptime(dt_combo, format='%d/%m/%Y %H:%M:%S')

plot_data <- data.frame(dt_asDate, as.numeric(as.character(data_on_dates$Sub_metering_1)), as.numeric(as.character(data_on_dates$Sub_metering_2)), as.numeric(as.character(data_on_dates$Sub_metering_3)))
names(plot_data) <- c('date', 'submeter1', 'submeter2', 'submeter3')

plot(plot_data$date, plot_data$submeter1 ,type="l",col="black", xlab='', ylab="Enery sub metering")
lines(plot_data$date,plot_data$submeter2,col="red")
lines(plot_data$date,plot_data$submeter3,col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

dev.off()