### plot 2
allEPC2<-read.table("./CourseraPro1/household_power_consumption.txt",
                    sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
# subset data using dplyr package
library(dplyr)
subEPC2<-filter(allEPC2,Date=="1/2/2007" | Date=="2/2/2007")
str(subEPC2)

# create a date-time variable setting your locale on english language
Sys.setlocale(category="LC_TIME",locale="English_United States.1252")
subEPC2$DateTime<-strptime(paste(subEPC2$Date,subEPC2$Time),format="%d/%m/%Y %H:%M:%S")
str(subEPC2)

# create the second plot
with(subEPC2,{ 
     plot(DateTime,Global_active_power,
     type="l",xlab="", ylab="Global Active Power (kilowatts)")})

# Copy the second plot to a PNG file and Don't forget to close the PNG device!
dev.copy(png,file="./CourseraPro1/plot2.png",width=480,height=480) ; dev.off()
