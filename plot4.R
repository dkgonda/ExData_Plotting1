#plot4.R
#Loads data and creates plot4 from Projec Assignment 1 of
#Coursera's "Exploratory Data Analysis"
#(Aug 2014 session).
#
#script assumes that code file load_data.R is in the 
#working directory.
#
#png graphics file is written to working directory

source("load_data.R")

writeLines("creating plot4.png...")

png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2, 2))

with(powerdata, {
  
  #panel[1,1] plot
  plot(datetime,
       Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  #panel[1,2] plot
  plot(datetime, Voltage, type="l")
  
  #panel[2,1] plot
  plot(datetime,
       Sub_metering_1,
       type="l",
       col="black",
       xlab="",
       ylab="Energy sub metering")
  
  lines(datetime,
        Sub_metering_2,
        col="red")
  
  lines(datetime,
        Sub_metering_3,
        col="blue")
  
  legend("topright",
         legend=c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
         lty=1,
         bty="n",
         col=c("black","red","blue"))
  
  #panel [2,2] plot
  plot(datetime, Global_reactive_power, type="l")
})

dev.off()

writeLines("...plot complete")
