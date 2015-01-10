library(dplyr)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata1 <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
newdata <- mutate(mydata1, full_date = paste(mydata1$Date, mydata1$Time))
newdata$full_date <- strptime(newdata$full_date, format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
with(newdata, {plot(x = newdata$full_date, y = newdata$Global_active_power, type = "l", 
                    xlab = "", ylab = "", col = "black", fg = "black")
               mtext("Global Active Power (kilowatts)", side = 2, line = 2.5, cex = 0.6, 
                     col = "black")
               plot(x = newdata$full_date, y = newdata$Voltage, type = "l", 
                    xlab = "", ylab = "", col = "black", fg = "black")
               mtext("datetime", side = 1, line = 2.5, cex = 0.6, col = "black")
               mtext("Voltage", side = 2, line = 2.5, cex = 0.6, col = "black")
               plot(x = newdata$full_date, y = newdata$Sub_metering_1, type = "l", xlab = "", 
                    ylab = "Energy sub metering", col = "black", fg = "black")
               with(subset(newdata), points(x = newdata$full_date, y = newdata$Sub_metering_2, 
                                            type = "l", col = "red"))
               with(subset(newdata), points(x = newdata$full_date, y = newdata$Sub_metering_3, 
                                            type = "l", col = "blue"))
               legend("topright", lty = 1, col = c ("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = "black", 
       cex = 0.7)
       plot(x = newdata$full_date, y = newdata$Global_reactive_power, type = "l", 
            xlab = "", ylab = "", col = "black", fg = "black")
       mtext("datetime", side = 1, line = 2.5, cex = 0.6, col = "black")
       mtext("Global_reactive_power", side = 2, line = 2.5, cex = 0.6, col = "black")
})