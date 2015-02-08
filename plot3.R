### plot 3
allEPC3<-read.table("./CourseraPro1/household_power_consumption.txt",
                    sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
str(allEPC3)
# subset data using dplyr package
library(dplyr)
subEPC3<-filter(allEPC3,Date=="1/2/2007" | Date=="2/2/2007")
str(subEPC3)

# create a date-time variable setting your locale on english language
Sys.setlocale(category="LC_TIME",locale="English_United States.1252")
subEPC3$DateTime<-strptime(paste(subEPC3$Date,subEPC3$Time),format="%d/%m/%Y %H:%M:%S")
str(subEPC3)

# create the third plot
with(subEPC3,{
        plot(DateTime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering",col="black")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))})

# Copy the third plot to a PNG file and Don't forget to close the PNG device!
dev.copy(png,file="./CourseraPro1/plot3.png",width=480,height=480) ; dev.off()