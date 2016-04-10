
#reading the data and filtering
exadata <- fread("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)

exadata$Date<-dmy(exadata$Date)
req<-filter(exadata,year(exadata$Date) == 2007,month(exadata$Date)== 2)
req2<-filter(req,day(req$Date)==1|day(req$Date)==2)
#req2$Global_active_power<-as.numeric(req2$Global_active_power)
req2 <- japply( req2, req2[,3:9], as.numeric )

#plot3
png(filename = "Plot3.png",width = 480,height = 480,units = "px")
par(ps=22,cex=0.60)
plot(dist,req2$Sub_metering_1,type= "l",xlab="",ylab="Energy Sub metering")
points(dist,req2$Sub_metering_2,type = "l",col="red")
points(dist,req2$Sub_metering_3,type = "l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()