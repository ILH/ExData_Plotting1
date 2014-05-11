
#read data from 1st to 2nd February 2007
data<-read.table("household_power_consumption.txt", head=T, sep=";",
                 skip=66636, nrows=2880)
#Naming columns
names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

# Converting Date & Time character variable into Date/Time variable and creating new variable
data$DateTime <- paste(data[,1], data[,2]) #Creation new variable Date&Time
data$DateTime<- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S') # Converting the new variable to Date/Time Format

# Plot file creation
png(file="Plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#Plot params 2 rows/ 2 columns
par(mfrow=c(2,2))

#Plot 1
with(data, plot(DateTime, Global_active_power,type="l", col="black", ylab="Global Active Power (kilowatts)", xlab=""))

#Plot2
with(data, plot(DateTime, Voltage,type="l", col="black", ylab="Voltage", xlab="datetime"))

#Plot3
with (data, plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=""))
with (data, lines(DateTime, Sub_metering_2, type="l", col="red"))
with (data, lines(DateTime, Sub_metering_3, type="l", col="blue"))

#Plot 4
with(data, plot(DateTime, Global_reactive_power, type="l", col="black", ylab="Global Active Power (kilowatts)", xlab="datetime"))

#File creation
dev.off()