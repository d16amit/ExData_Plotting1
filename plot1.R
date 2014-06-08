plot1 <- function() {

	## Read the input file. Filedownloaded and unzipped to working directory
	file2read<-"household_power_consumption.txt"
	dat<-	read.table(file2read,sep=";",header=TRUE,na.strings='?')
	## Subset the data for desired dates	
	sdat<-subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
 	
	## Adding new column as DateTime from Data and Time variables 
	sdat$DateTime <- strptime(paste(sdat$Date, sdat$Time),format="%d/%m/%Y %H:%M:%S")
 	
	## For Plot 1 converting GlobalActivePoer to Numeric
	sdat$numGlobal_active_power=as.numeric(as.character(sdat$Global_active_power))
 	
	## create PNG file
	if(! dev.cur()==1) {dev.off()}
	png(file="plot1.png,width = 480, height = 480")	
	## Plot 1 Histogram
	 hist(sdat$numGlobal_active_power,main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")

	dev.off()

}


