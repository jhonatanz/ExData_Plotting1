## Assigment #1 of exploratory data analysis course
# Plot 2, will show a drawing of active power versus time
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
png(filename = "plot2.png")
plot(data1$R_time, data1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data1$R_time, data1$Global_active_power)
dev.off()
