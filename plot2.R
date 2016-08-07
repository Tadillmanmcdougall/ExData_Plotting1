PowerConsumption <- read.table("household_power_consumption.txt", sep = ";", 
                               header = TRUE, na.strings = "?")
day1 <- subset(PowerConsumption, Date == "1/2/2007")
day2 <- subset(PowerConsumption, Date == "2/2/2007")
PowerConsumption <- rbind.data.frame(day1, day2)
Time <- PowerConsumption[,1:2]
Time <- apply(Time, 1, paste, collapse = " ")
Time <- strptime(Time, format = "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(Time, PowerConsumption$Global_active_power, type = "n", 
ylab = "Global Active Power (kilowatts)", xlab = "")
lines(Time, PowerConsumption$Global_active_power)
dev.off()