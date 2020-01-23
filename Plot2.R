# As for plot one, read in the data, assign numeric.
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


# Create the plot of new varialle (x) vs. GAP (y) and see if looks like requirement.
plot(powerdata2$Global_active_power ~ powerdata2$DateTime, type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Print to .png as plot 2 (480 x 480 pixels) 
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()