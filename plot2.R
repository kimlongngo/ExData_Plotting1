require(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", dec =".", stringsAsFactors = F, header = T)
samp <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(samp$Date,samp$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")
samp[, 3] <- as.numeric(samp[, 3])

png("plot2.png", width=480, height=480)
plot(datetime, samp[, 3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
