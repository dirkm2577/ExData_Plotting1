library(dplyr)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata1 <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
mydata2 <- select(mydata1, Global_active_power)
par(cex.axis = 0.7, cex.lab = 0.7, cex.main = 0.8, lheight = 0.1, mar = c(4, 4, 3, 3))
with(mydata2, hist(as.numeric(mydata2$Global_active_power), main = "Global Active Power", 
                   xlab = "", ylab = "", col = "red"))
mtext("Global Active Power (kilowatts)", side = 1, line = 2.5, cex = 0.7, col = "black")
mtext("Frequency", side = 2, line = 2.5, cex = 0.7, col = "black")