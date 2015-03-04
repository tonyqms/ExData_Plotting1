file <- "./R course/household_power_consumption.txt"
data <- read.table(file, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)
##plot2
plot(sub$Global_active_power~sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="./GitHub/ExData_Plotting1/plot2.png", height=480, width=480)
dev.off()