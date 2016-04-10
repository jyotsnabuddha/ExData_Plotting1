
#reading the data and filtering only the required 
exadata <- fread("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)

exadata$Date<-dmy(exadata$Date)
req<-filter(exadata,year(exadata$Date) == 2007,month(exadata$Date)== 2)
req2<-filter(req,day(req$Date)==1|day(req$Date)==2)
#req2$Global_active_power<-as.numeric(req2$Global_active_power)
req2 <- japply( req2, req2[,3:9], as.numeric )

#plot2
png(filename = "Plot2.png",width = 480,height = 480,units = "px")
dist<- strptime(paste(req2$Date,req2$Time),"%Y-%m-%d %H:%M:%S")
plot(dist,req2$Global_active_power,type="l",xlab="",ylab="Global Active Power(Killowatts)")
dev.off()