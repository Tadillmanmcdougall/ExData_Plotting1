PowerConsumption <- read.table("household_power_consumption.txt", sep = ";",
                               header = TRUE, na.strings = "?")
day1 <- subset(PowerConsumption, Date == "1/2/2007")
day2 <- subset(PowerConsumption, Date == "2/2/2007")
PowerConsumption <- rbind.data.frame(day1, day2)
Time <- PowerConsumption[,1:2]
Time <- apply(Time, 1, paste, collapse = " ")
Time <- strptime(Time, format = "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(Time, PowerConsumption$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", xlab = "")
lines(Time, PowerConsumption$Sub_metering_1, col = "black")
lines(Time, PowerConsumption$Sub_metering_2, col = "red")
lines(Time, PowerConsumption$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
       lty = c(1,1,1))
dev.off()