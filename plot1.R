library(data.table)
library(plyr)
setwd("./downloads")
data <- fread("household_power_consumption.txt")
data2=subset(data,Date=='1/2/2007' | Date=="2/2/2007")
data3=mutate(data2,Time=as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
data4=data.frame(data3) # change the data.table to a data frame format
data4[,3:9]=sapply(data4[,3:9],as.numeric)
hist(data4[,3],col="red",xlab="Global Active Power (kilowatts)",main=("Global Active Power"))

#save the plot as a 480x480 pixel png file
png(filename="/Users/daniel/desktop/project/plot1.png",width=480,height=480,unit="px")
hist(data4[,3],col="red",xlab="Global Active Power (kilowatts)",main=("Global Active Power"))
dev.off()
