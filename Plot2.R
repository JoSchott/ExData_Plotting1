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

png(filename="plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower,type="l", xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()