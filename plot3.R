hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE) ##Load data from txt file
feb_stats <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007") ##Create list including only data from Feb. 1, 2007 and Feb. 2, 2007


##Code below converts character values of time to Time class
feb_stats_date_time <- paste(feb_stats$Date,feb_stats$Time, sep=":") ##Concatenates Date and Time values in cols. 1 and 2
feb_stats$Time <- strptime(feb_stats_date_time, "%d/%m/%Y:%H:%M:%S") ##Converts to Time class
 

png(filename = "plot3.png", width=480, height=480) ##Open PNG file device & create "plot3.png" file in working directory

plot(x=feb_stats$Time, y=feb_stats$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="", col="black")
lines(x=feb_stats$Time, y=feb_stats$Sub_metering_2, type="l", col="orangered3")
lines(x=feb_stats$Time, y=feb_stats$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "orangered3", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() ## Close the PNG file device
