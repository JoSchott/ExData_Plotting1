#assume the database file is located in the working directory

fn <- "household_power_consumption.txt"

#column names and data types

colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c(rep("character",2), rep("numeric",7) )


#read file

df <- read.table(fn, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")


#convert to Date and time types

df$date = as.Date(df$date, format="%d/%m/%Y")
strptime(household_power_consumption$Time,format="%H:%M:%S")

#filter so that only the 2 relevant dates are included

df = df[df$date == as.Date("2007-02-01")  | df$date==as.Date("2007-02-02"),]


#plot and save graph

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(df$globalActivePower,type="l", xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
plot(df$voltage,type="l",xaxt="n",xlab="datetime",ylab="Voltage")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
plot(df$subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(x=df$subMetering2, col="red")
lines(x=df$subMetering3, col="blue")
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), bty='n',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(df$globalReactivePower,type="l", xaxt="n", xlab="datetime", ylab="Globa_reactive_power")
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
