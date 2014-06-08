plot4 <- function() {

	## Read the input file. Filedownloaded and unzipped to working directory
	file2read<-"household_power_consumption.txt"
	dat<-	read.table(file2read,sep=";",header=TRUE,na.strings='?')
	## Subset the data for desired dates	
	sdat<-subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
 	
	## Adding new column as DateTime from Data and Time variables 
	sdat$DateTime <- strptime(paste(sdat$Date, sdat$Time),format="%d/%m/%Y %H:%M:%S")
 	
	## For Plot 4 converting variables to Numeric
	sdat$numGlobal_active_power=as.numeric(as.character(sdat$Global_active_power))

	sdat$numSub_metering_1=as.numeric(as.character(sdat$Sub_metering_1))
	sdat$numSub_metering_2=as.numeric(as.character(sdat$Sub_metering_2))
	sdat$numSub_metering_3=as.numeric(as.character(sdat$Sub_metering_3))

	sdat$numVoltage=as.numeric(as.character(sdat$Voltage))

	sdat$numGlobal_reactive_power=as.numeric(as.character(sdat$Global_reactive_power))
	 	


	## create PNG file
	if(! dev.cur()==1) {dev.off()}
	png(file="plot4.png",width = 480, height = 480,bg="transparent")	
	## set frame size
	par(mfrow=c(2,2))	

	## Graph1 Global_active_power Line Graph	
	plot(sdat$DateTime, sdat$numGlobal_active_power,pch=NA_integer_,xlab="",ylab="Global Active Power")
	lines(sdat$DateTime, sdat$numGlobal_active_power)

	## Graph2 Voltage Line Graph
	plot(sdat$DateTime, sdat$numVoltage,pch=NA_integer_,xlab="datetime",ylab="Voltage")
	lines(sdat$DateTime, sdat$numVoltage)

	## Graph3 Energy sub metering multi line plot
	plot(sdat$DateTime, sdat$numSub_metering_1,pch=NA_integer_,xlab="",ylab="Energy sub metering")
	lines(sdat$DateTime, sdat$numSub_metering_1,col="black")
	lines(sdat$DateTime, sdat$numSub_metering_2,col="red")
	lines(sdat$DateTime, sdat$numSub_metering_3,col="blue")
 	legend("topright",bty = "n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c ("black","red","blue"),lty=1)

	## Graph4  Global_reactive_power Line Graph
	plot(sdat$DateTime, sdat$numGlobal_reactive_power,pch=NA_integer_,xlab="datetime",ylab="Global_reactive_power")
	lines(sdat$DateTime, sdat$numGlobal_reactive_power)

	dev.off()

}


