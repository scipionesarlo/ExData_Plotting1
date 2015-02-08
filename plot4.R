### plot 4
allEPC4<-read.table("./CourseraPro1/household_power_consumption.txt",
                    sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
str(allEPC4)
# subset data using dplyr package
library(dplyr)
subEPC4<-filter(allEPC4,Date=="1/2/2007" | Date=="2/2/2007")
str(subEPC4)

# create a date-time variable
Sys.setlocale(category="LC_TIME",locale="English_United States.1252")
subEPC4$DateTime<-strptime(paste(subEPC4$Date,subEPC4$Time),format="%d/%m/%Y %H:%M:%S")
str(subEPC4)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(subEPC4,{
        plot(DateTime,Global_active_power,
             type="l",xlab="", ylab="Global Active Power")
        plot(DateTime,Voltage,
             type="l",xlab="datetime",ylab="Voltage",col="black")
        plot(DateTime,Sub_metering_1,
             type="l",xlab="",ylab="Energy sub metering",col="black")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,bty="n")
        plot(DateTime,Global_reactive_power,
             type="l",xlab="datetime",ylab="Global_reactive_power",col="black")
})

# Copy the fourth plot to a PNG file and Don't forget to close the PNG device!
dev.copy(png,file="./CourseraPro1/plot4.png",width=480,height=480) ; dev.off()