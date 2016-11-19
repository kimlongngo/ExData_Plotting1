require(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", dec =".", stringsAsFactors = F, header = T)
samp <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

samp[, 3] <- as.numeric(samp[, 3])

png("plot1.png", width=480, height=480)
hist(samp$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()