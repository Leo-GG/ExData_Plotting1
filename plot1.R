
## Download and read data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),  header=T, quote="\"", sep=";",na.strings="?")
unlink(temp)

## Reformat dates
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))

## Subset data
pData<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

## Make plot
png(filename="plot1.png")
hist(pData$Global_active_power,col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()