plot3 <- function() {

	## Read the input file. Filedownloaded and unzipped to working directory
	file2read<-"household_power_consumption.txt"
	dat<-	read.table(file2read,sep=";",header=TRUE,na.strings='?')
	## Subset the data for desired dates	
	sdat<-subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
 	
	## Adding new column as DateTime from Data and Time variables 
	sdat$DateTime <- strptime(paste(sdat$Date, sdat$Time),format="%d/%m/%Y %H:%M:%S")
 	
	## For Plot 3 converting GlobalActivePoer to Numeric
	sdat$numSub_metering_1=as.numeric(as.character(sdat$Sub_metering_1))
	sdat$numSub_metering_2=as.numeric(as.character(sdat$Sub_metering_2))
	sdat$numSub_metering_3=as.numeric(as.character(sdat$Sub_metering_3))
 	
	## create PNG file
	if(! dev.cur()==1) {dev.off()}
	png(file="plot3.png",width = 480, height = 480)	
	## Plot 3 multi line plot
		 
	plot(sdat$DateTime, sdat$numSub_metering_1,pch=NA_integer_,xlab="",ylab="Energy sub metering")
	lines(sdat$DateTime, sdat$numSub_metering_1,col="black")
	lines(sdat$DateTime, sdat$numSub_metering_2,col="red")
	lines(sdat$DateTime, sdat$numSub_metering_3,col="blue")
 	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c ("black","red","blue"),lty=1)

	dev.off()

}


