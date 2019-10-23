
## Download and read data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),  header=T, quote="\"", sep=";",na.strings="?")
unlink(temp)

## Reformat dates
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))

## Subset data
pData<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

## Get dates AND times
datetime <- strptime(paste(pData$Date, pData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Make plot
png(filename="plot3.png")
plot(datetime, pData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, pData$Sub_metering_2, col="red")
lines(datetime, pData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5,col=c("black", "red", "blue"))
dev.off()