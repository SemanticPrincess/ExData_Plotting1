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

#render graph
with(dataRefined, plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power, main="Global Active Power", type='l', xlab="", ylab="Global Active Power(kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()