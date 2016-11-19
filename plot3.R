require(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", dec =".", stringsAsFactors = F, header = T)
samp <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(samp$Date,samp$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")
for (i in 3:8) {
        samp[, i] <- as.numeric(samp[, i])
}


png("plot3.png", width = 480, height = 480)
plot(datetime, samp[, 7], type = "l", xlab = " ", ylab = "Energy Sub Metering")
lines(datetime, samp[, 8], type = "l", col = "red")
lines(datetime, samp[, 9], type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()