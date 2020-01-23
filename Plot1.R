#start by reading in the datafile, which is currently in the working directory
#instructions stated  that .na=? and describe each of the variables.
#Note to self: after much trial and error in later steps when attempting to make plots
#I realized I needed to make the .txt data numeric data, so added that step initially when reading the file, using colClasses function.
setwd("~/Desktop/Coursera")
classlist<-c(Global_active_power="numeric", Global_reactive_power="numeric", Voltage="numeric", Global_intensity="numeric", Sub_metering_1="Numeric", Sub_metering_2="Numeric", Sub_metering_3="numeric")
powerdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE, na.strings="?", colClasses=classlist)

#keep data of interest ( 1/2/2007 AND  2/2/2007 )
powerdata2 <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")

#Get rid of NAs
powerdata2<-na.omit(powerdata2)

#Create the histogram on the screen include x and y labels, main title, and color.
hist(powerdata2$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)") 
#Double check that it matches requirement, then create plot1.png.(480 x 480 pixels)
dev.copy(png,file="plot1.png", height=480, width=480) 
dev.off()