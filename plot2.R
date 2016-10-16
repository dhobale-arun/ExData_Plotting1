tat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

tat$Date <- as.Date(tat$Date, "%d/%m/%Y")
  

tat <- subset(tat,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  

tat <- tat[complete.cases(tat),]


dateTime <- paste(tat$Date, tat$Time)

dateTime <- setNames(dateTime, "DateTime")
  
tat <- tat[ ,!(names(tat) %in% c("Date","Time"))]

tat <- cbind(dateTime, tat)
  
tat$dateTime <- as.POSIXct(dateTime)

plot(tat$dateTime,tat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
 dev.copy(png,"plot2.png", width=480, height=480)
dev.off()