library(data.table)
library(plyr)
setwd("./downloads")
data <- fread("household_power_consumption.txt")
data2=subset(data,Date=='1/2/2007' | Date=="2/2/2007")
data3=mutate(data2,Time=as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
data4=data.frame(data3)   # change the data.table to a data frame format
data4[,3:9]=sapply(data4[,3:9],as.numeric)
par(mfcol=c(2,2))
# 1st plot
plot(data4[,2],data4[,3],type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data4[,2],data4[,3])
# 2nd plot
plot(data4[,2],data4[,7],type="n",xlab="",ylab="Energy sub metering")
lines(data4[,2],data4[,7])
lines(data4[,2],data4[,8],col="red")
lines(data4[,2],data4[,9],col="blue")
legend("topright",bty="n",lty=1,legend=names(data4)[7:9],col=c("black","red","blue"))
# 3rd plot
plot(data4[,2],data4[,5],type="n",xlab="datetime",ylab="Voltage")
lines(data4[,2],data4[,5])
#4th plot
plot(data4[,2],data4[,4],type="n",xlab="datetime",ylab=names(data4)[4])
lines(data4[,2],data4[,4])

#save the image
png(filename="/Users/daniel/desktop/project/plot4.png",width=480,height=480,unit="px")
par(mfcol=c(2,2))
# 1st plot
plot(data4[,2],data4[,3],type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data4[,2],data4[,3])
# 2nd plot
plot(data4[,2],data4[,7],type="n",xlab="",ylab="Energy sub metering")
lines(data4[,2],data4[,7])
lines(data4[,2],data4[,8],col="red")
lines(data4[,2],data4[,9],col="blue")
legend("topright",bty="n",lty=1,legend=names(data4)[7:9],col=c("black","red","blue"))
# 3rd plot
plot(data4[,2],data4[,5],type="n",xlab="datetime",ylab="Voltage")
lines(data4[,2],data4[,5])
#4th plot
plot(data4[,2],data4[,4],type="n",xlab="datetime",ylab=names(data4)[4])
lines(data4[,2],data4[,4])
dev.off()