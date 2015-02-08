## plot 1 Global Active Power (kilowatts)
allEPC1<-read.table("./CourseraPro1/household_power_consumption.txt",
                    sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
# subset data using dplyr package
library(dplyr)
subEPC1<-filter(allEPC1,Date=="1/2/2007" | Date=="2/2/2007")

# create the first plot
with(subEPC1,{
        hist(Global_active_power,col="orangered",breaks=20,
        main="Global Active Power",xlab="Global Active Power (kilowatts)")})

# Copy the first plot to a PNG file and Don't forget to close the PNG device!
dev.copy(png,file="./CourseraPro1/plot1.png",width=480,height=480) ; dev.off()