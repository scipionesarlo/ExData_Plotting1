# set work directory on your pc
getwd()
setwd("C:/Users/Scipio/Desktop/WDRStudio/CourseraEDA")
# create a file-directory to store data sets
if(!file.exists("./CourseraPro1")){dir.create("./CourseraPro1")}

# download data using downloader package
require(downloader)
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(fileUrl,"./CourseraPro1/EPC.zip",mode="wb")

# list all files in the zipped file
unzip("./CourseraPro1/EPC.zip", list = TRUE, unzip = "internal")
# unzip all files
unzip("./CourseraPro1/EPC.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "./CourseraPro1", unzip = "internal",
      setTimes = FALSE)

# The dataset has 2,075,259 rows and 9 columns. 
# First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
# Make sure your computer has enough memory (most modern computers should be fine).

# calculate the rough estimation
RoughEstimation<-function(Nrows,Ncolumns,units="auto")
{TypeUnits<-list("auto","b","B","Kb","KB","Mb","MB","Gb","GB","Tb","TB")
 if (units==TypeUnits[1])
 {Estimation=Nrows*Ncolumns*8}
 if (units==TypeUnits[2])
 {Estimation=Nrows*Ncolumns*8}
 if (units==TypeUnits[3])
 {Estimation=Nrows*Ncolumns*8}
 if (units==TypeUnits[4])
 {Estimation=Nrows*Ncolumns*8/(10^3)}
 if (units==TypeUnits[5])
 {Estimation=Nrows*Ncolumns*8/(10^3)}
 if (units==TypeUnits[6])
 {Estimation=Nrows*Ncolumns*8/(10^6)}
 if (units==TypeUnits[7])
 {Estimation=Nrows*Ncolumns*8/(10^6)}
 if (units==TypeUnits[8])
 {Estimation=Nrows*Ncolumns*8/(10^9)}
 if (units==TypeUnits[9])
 {Estimation=Nrows*Ncolumns*8/(10^9)}
 if (units==TypeUnits[10])
 {Estimation=Nrows*Ncolumns*8/(10^12)}
 if (units==TypeUnits[11])
 {Estimation=Nrows*Ncolumns*8/(10^12)}
 print(Estimation);print(units)        
}

RoughEstimation(2075259,9,"Gb")

# read and inspect data
allEPC<-read.table("./CourseraPro1/household_power_consumption.txt",
                   sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
OS<-object.size(allEPC)
print(OS,units="GB")

names(allEPC)
str(allEPC)
head(allEPC,2)
sum(is.na(allEPC))
sum(is.na(allEPC$Date))
sum(is.na(allEPC$Time))
sum(is.na(allEPC$Global_intensity))