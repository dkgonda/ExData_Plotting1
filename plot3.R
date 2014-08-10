#plot3.R
#Loads data and creates plot3 from Projec Assignment 1 of
#Coursera's "Exploratory Data Analysis"
#(Aug 2014 session).
#
#script assumes that code file load_data.R is in the 
#working directory.
#
#png graphics file is written to working directory

source("load_data.R")

writeLines("creating plot3.png...")

png("plot3.png", width=480, height=480, units="px")

with(powerdata, {
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
             col=c("black","red","blue"))
})

dev.off()

writeLines("...plot complete")