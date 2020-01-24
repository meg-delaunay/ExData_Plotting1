data <- read.csv("household_power_consumption.txt", sep=";")
data_on_dates <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]

png('plot1.png')
hist(as.numeric(as.character(data_on_dates$Global_active_power)), col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
axis(1, at=c(0, 2, 4, 6))
axis(2, at=c(0, 200, 400, 600, 800, 1000, 1200))
dev.off()