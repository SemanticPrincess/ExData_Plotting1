setwd("C:/Users/SemanticPrincess/Desktop/dataSciencecoursera/ExploratoryDataAnalysis")

#read in data
data<-read.table("C:/Users/SemanticPrincess/Desktop/dataSciencecoursera/ExploratoryDataAnalysis/household_power_consumption.txt",header=T,sep=";",as.is=T,strings="?")

#format date
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#extract only the required dates (2007-2-01 and 2007-02-02)
dataRefined<-data[data$Date=='2007-02-01'|data$Date =='2007-02-02',]

#loop through the 9 columns
for(i in 3:9) 
        dataRefined[,i]<-as.numeric(dataRefined[,i])

#render graph with submetering 1-4
with(dataRefined, plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1, type='l', xlab="", ylab="Energy sub metering"))
with(dataRefined, lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2, col='red'))
with(dataRefined, lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3, col='blue'))
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red', 'blue'),lwd=1,pt.cex=1)
dev.copy(png,file="plot3.png")
dev.off()