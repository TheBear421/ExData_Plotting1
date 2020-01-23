# As for plots one and two, read in the data, assign numeric.
setwd("~/Desktop/Coursera")
classlist<-c(Global_active_power="numeric", Global_reactive_power="numeric", Voltage="numeric", Global_intensity="numeric", Sub_metering_1="Numeric", Sub_metering_2="Numeric", Sub_metering_3="numeric")
powerdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE, na.strings="?", colClasses=classlist)

#keep data of interest ( 1/2/2007 AND  2/2/2007 )
powerdata2 <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")

#Get rid of NAs
powerdata2<-na.omit(powerdata2)

# Using the hints from the instructions, use as.Date, and POSIXct along with cbind to join time and date and create new variable.  
powerdata2$Date<-as.Date(powerdata2$Date, "%d/%m/%Y")
powerdata2<-cbind(powerdata2, "DateTime"= as.POSIXct(paste(powerdata2$Date,powerdata2$Time)))

#Now create the plot using with and lines to add the three different lines of different color.  Once it looks right, then pring to plot3.png.
with(powerdata2, {plot(Sub_metering_1 ~ DateTime, type="l",xlab="",ylab="Energy Sub Metering")})
lines(powerdata2$Sub_metering_2~ powerdata2$DateTime, type="l", col="red")
lines(powerdata2$Sub_metering_3~ powerdata2$DateTime, type="l", col="blue")
legend("topright", lty=1, lwd=3, col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#print to .png as plot 3 (480 x 480 pixels) 

dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()