## Assigment #1 of exploratory data analysis course
# Plot 4, will show a four curves of one drawing
# The dataset used extracted from household_power_consumption.txt file which must be copied on
# the working directory to work.
# the result is only for a date frame from Feb-1-2007 to Feb-2-2007

# Reading data:
# data selected only for the date frame
rm(list = ls())
data1<-read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
# header extraction
header<-read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1)
names(data1)<-sapply(header, levels)

#date and time convertion to R format:
data1<-cbind(data1, R_time = paste(data1$Date, data1$Time))
data1$R_time<-strptime(data1$R_time, "%d/%m/%Y %H:%M:%S")

# Plotting the curve
png(filename = "plot4.png")
par(mfrow = c(2, 2))
# first sub plot
plot(data1$R_time, data1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(data1$R_time, data1$Global_active_power)
# second sub plot
plot(data1$R_time, data1$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data1$R_time, data1$Voltage)
# third sub plot
plot(data1$R_time, data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data1$R_time, data1$Sub_metering_1)
lines(data1$R_time, data1$Sub_metering_2, col = "red")
lines(data1$R_time, data1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
# fourth sub plot
plot(data1$R_time, data1$Global_reactive_power, type = "n", xlab = "datetime")
lines(data1$R_time, data1$Global_reactive_power)
dev.off()