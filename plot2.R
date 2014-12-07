library(data.table)
library(plyr)
setwd("./downloads")
data <- fread("household_power_consumption.txt")
data2=subset(data,Date=='1/2/2007' | Date=="2/2/2007")
data3=mutate(data2,Time=as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
data4=data.frame(data3)   # change the data.table to a data frame format
data4[,3:9]=sapply(data4[,3:9],as.numeric)
plot(data4[,2],data4[,3],type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data4[,2],data4[,3])

#save the image
png(filename="/Users/daniel/desktop/project/plot2.png",width=480,height=480,unit="px")
plot(data4[,2],data4[,3],type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data4[,2],data4[,3])
dev.off()