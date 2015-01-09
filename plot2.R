library(dplyr)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata1 <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
newdata <- mutate(mydata1, full_date = paste(mydata1$Date, mydata1$Time))
newdata2 <- select(newdata, Global_active_power, full_date)
newdata2$full_date <- strptime(newdata2$full_date, format = "%d/%m/%Y %H:%M:%S")
plot(x = newdata2$full_date, y = newdata2$Global_active_power, type = "l", 
     xlab = "", ylab = "", col = "black", fg = "black")
mtext("Global Active Power (kilowatts)", side = 2, line = 2.5, cex = 0.7, col = "black")
