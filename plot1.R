## Assigment #1 of exploratory data analysis course
# Plot 1, will show an histogram for global active power usign base graphics tools on R
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

# Plotting the histogram
png(filename = "plot1.png")
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
