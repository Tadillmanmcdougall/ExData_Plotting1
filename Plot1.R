PowerConsumption <- read.table("household_power_consumption.txt", sep = ";", 
                               header = TRUE, na.strings = "?")
day1 <- subset(PowerConsumption, Date == "1/2/2007")
day2 <- subset(PowerConsumption, Date == "2/2/2007")
PowerConsumption <- rbind.data.frame(day1, day2)
png("plot1.png")
with(PowerConsumption, hist(Global_active_power, main = "Global Active Power", 
                            col = "red", xlab = "Global Active Power 
                            (kilowatts)"))
dev.off()