library(lubridate)
library(plyr)
library(dplyr)
library(data.table)
library(taRifx)

setwd("C:/Users/jyoana/Desktop/datasciencecoursera/R/exadata/")
exadata <- fread("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)

exadata$Date<-dmy(exadata$Date)
req<-filter(exadata,year(exadata$Date) == 2007,month(exadata$Date)== 2)
req2<-filter(req,day(req$Date)==1|day(req$Date)==2)
#req2$Global_active_power<-as.numeric(req2$Global_active_power)
req2 <- japply( req2, req2[,3:9], as.numeric )

#plot1
png(filename = "Plot1.png",width = 480,height = 480,units = "px")
hist(req2$Global_active_power,col="red",xlab = "Global Active Power(Killowatts)",main = "Global Active Power")
dev.off()







