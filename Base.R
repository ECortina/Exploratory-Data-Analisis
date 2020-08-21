### Read the table and save it to PWdata
#getwd()
PWdata <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## head(PWdata)
##summary(PWdata)


## Format date to Type Date

PWdata$Date <- as.Date(PWdata$Date, "%d/%m/%Y")
  
## Our overall goal here is simply to examine how household energy usage varies over a 2-day period in 
##February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.


PWdata <- subset(PWdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
PWdata <- PWdata[complete.cases(PWdata),]

## Combine Date and Time column
dateTime <- paste(PWdata$Date, PWdata$Time)
  
## rename
dateTime <- setNames(dateTime, "DateTime")
  
## Remove Date and Time column
PWdata <- PWdata[ ,!(names(PWdata) %in% c("Date","Time"))]
  
## Add DateTime column
PWdata <- cbind(dateTime, PWdata)
  
## Format dateTime Column
PWdata$dateTime <- as.POSIXct(dateTime)