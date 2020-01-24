data <- read.csv("household_power_consumption.txt", sep=";")
data_on_dates <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]
rm(data)

png('plot2.png')

dt_combo <- paste(data_on_dates$Date, data_on_dates$Time)
dt_asDate <- strptime(dt_combo, format='%d/%m/%Y %H:%M:%S')

plot_data <- data.frame(dt_asDate, data_on_dates$Global_active_power)
names(plot_data) <- c('date', 'gap')

plot(plot_data$date, as.numeric(as.character(plot_data$gap)), type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()