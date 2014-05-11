
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
png(file="Plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#Plot params 1 row/ 1 column
par(mfrow=c(1,1))

#Plot creation
with (data, plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")) #New plotting + 1st data
with (data, lines(DateTime, Sub_metering_2, type="l", col="red")) # 2nd data
with (data, lines(DateTime, Sub_metering_3, type="l", col="blue")) # 3d data

#Legend creation
legend("topright", cex=1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#File creation
dev.off()