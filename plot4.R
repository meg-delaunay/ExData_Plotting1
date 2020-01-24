#read_data:
data <- read.csv("household_power_consumption.txt", sep=";")
data_on_dates <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]
rm(data)

png('plot4.png')

#setup date data:
dt_combo <- paste(data_on_dates$Date, data_on_dates$Time)
dt_asDate <- strptime(dt_combo, format='%d/%m/%Y %H:%M:%S')

#set up plot grid
par(mfrow=c(2,2))

#plot1:
plot_data <- data.frame(dt_asDate, data_on_dates$Global_active_power)
names(plot_data) <- c('date', 'gap')
plot(plot_data$date, as.numeric(as.character(plot_data$gap)), type='l', xlab='', ylab='Global Active Power (kilowatts)')

#plot2:
plot_data <- data.frame(dt_asDate, as.numeric(as.character(data_on_dates$Voltage)))
names(plot_data) <- c('date', 'voltage')
plot(plot_data$date, plot_data$voltage, xlab="datetime", ylab='Voltage', type='l')

#plot3: 
plot_data <- data.frame(dt_asDate, as.numeric(as.character(data_on_dates$Sub_metering_1)), as.numeric(as.character(data_on_dates$Sub_metering_2)), as.numeric(as.character(data_on_dates$Sub_metering_3)))
names(plot_data) <- c('date', 'submeter1', 'submeter2', 'submeter3')

plot(plot_data$date, plot_data$submeter1 ,type="l",col="black", xlab='', ylab="Enery sub metering")
lines(plot_data$date,plot_data$submeter2,col="red")
lines(plot_data$date,plot_data$submeter3,col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, box.lty=0)

#plot4: 
plot_data <- data.frame(dt_asDate, as.numeric(as.character(data_on_dates$Global_reactive_power)))
names(plot_data) <- c('date', 'grp')
plot(plot_data$date, plot_data$grp, xlab="datetime", ylab='Global_reative_power', type='l')
axis(2, at=c(0, 0.1, 0.2, 0.3, 0.4, 0.5))


dev.off()



