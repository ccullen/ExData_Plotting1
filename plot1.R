hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", as.is=TRUE) ##Load data from txt file
feb_stats <- subset(hpc, V1=="1/2/2007" | V1=="2/2/2007") ##Create list including only data from Feb. 1, 2007 and Feb. 2, 2007


##Code below converts character values to numeric--couldn't figure out how to load cols. 3-9 as numeric 
for(i in 3:ncol(feb_stats)){
  feb_stats[,i] <- as.numeric(feb_stats[,i])
}
 
hist(feb_stats$V3, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="orangered2")

png(filename = "plot1.png", width=480, height=480) ##Open PNG file device & create "plot1.png" file in working directory

hist(feb_stats$V3, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="orangered2")

dev.off() ## Close the PNG file device
