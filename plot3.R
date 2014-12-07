setwd("C:/apk/Education/Coursera/Rwork")
## One time download and unzipping of the project data
##fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download.file(fileurl, destfile = "HouseholdpowerConsumption.zip", mode="wb")
##unzip("HouseholdpowerConsumption.zip")

## Also one time install and library
#install.packages("data.table")
#library(data.table)

# Read the data and then subset the data for Feb 1, 2007 and Feb 2, 2007 data
datpwrcons <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings =c("?", ""))
datFeb <- datpwrcons[(datpwrcons$Date == '1/2/2007'  | datpwrcons$Date == '2/2/2007'),]

# concatenate date and time and convert it to data field. Add this column to existing data
dttm <- datFeb[, strptime(paste(datFeb$Date, datFeb$Time), format="%m/%d/%Y %H:%M:%S")]
datfeb12 <- cbind(datFeb,dttm)

#Third graph
plot_colors <- c("black","red","blue")
axis(1, at=1:3, lab=c("Thu","Fri","Sat"))
plot(datfeb12$Sub_metering_1, xlab="", ylab="Energy Sub metering", type = "n") 
plot(datfeb12$Sub_metering_1, xlab="", ylab="Energy Sub metering", type="l", ylim=c(0,40), col = plot_colors[1])
plot(datfeb12$Sub_metering_2, xlab="", ylab="Energy Sub metering", type="l", ylim=c(0,40), col = plot_colors[2])
plot(datfeb12$Sub_metering_3, xlab="", ylab="Energy Sub metering", type="l", ylim=c(0,40), col = plot_colors[3])

# Create a legend at topright that uses the 
# same line colors and points used by the actual plots
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.8, col=plot_colors, lty=1);


