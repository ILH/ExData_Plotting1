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
png(file="Plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#Plot params 1 row/ 1 column
par(mfrow=c(1,1))

#Plot creation
hist(data$Global_active_power, main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")

#File creation
dev.off()