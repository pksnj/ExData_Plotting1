setwd("C:/apk/Education/Coursera/Rwork")
## One time download and unzipping of the project data
##fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download.file(fileurl, destfile = "HouseholdpowerConsumption.zip", mode="wb")
##unzip("HouseholdpowerConsumption.zip")

#One time Intstall
#install.packages("data.table")
#library(data.table)

# Read the data and then subset the data for Feb 1, 2007 and Feb 2, 2007 data
datpwrcons <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings =c("?", ""))
datFeb <- datpwrcons[(datpwrcons$Date == '1/2/2007'  | datpwrcons$Date == '2/2/2007'),]

# concatenate date and time and convert it to data field. Add this column to existing data
dttm <- datFeb[, strptime(paste(datFeb$Date, datFeb$Time), format="%m/%d/%Y %H:%M:%S")]
datfeb12 <- cbind(datFeb,dttm)

#Second graph
plot(datfeb12$dttm, datfeb12$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
# plot(datfeb12$dttm, datfeb12$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file = "plot2.png")
dev.off()

