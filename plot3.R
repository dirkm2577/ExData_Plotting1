library(dplyr)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata1 <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
newdata <- mutate(mydata1, full_date = paste(mydata1$Date, mydata1$Time))
newdata2 <- select(newdata, full_date, Sub_metering_1, Sub_metering_2, Sub_metering_3)
newdata2$full_date <- strptime(newdata2$full_date, format = "%d/%m/%Y %H:%M:%S")
with(newdata2, plot(x = newdata2$full_date, y = newdata2$Sub_metering_1, type = "l", xlab = "", 
                    ylab = "Energy sub metering", col = "black", fg = "black"))
with(subset(newdata2), points(x = newdata2$full_date, y = newdata2$Sub_metering_2, type = "l",
                              col = "red"))
with(subset(newdata2), points(x = newdata2$full_date, y = newdata2$Sub_metering_3, type = "l",
                              col = "blue"))
legend("topright", lty = 1, col = c ("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = "black", 
       cex = 0.7)
