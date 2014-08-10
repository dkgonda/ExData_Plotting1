#plot2.R
#Loads data and creates plot2 from Projec Assignment 1 of
#Coursera's "Exploratory Data Analysis"
#(Aug 2014 session).
#
#script assumes that code file load_data.R is in the 
#working directory.
#
#png graphics file is written to working directory

source("load_data.R")

writeLines("creating plot2.png...")

png("plot2.png", width=480, height=480, units="px")

with(powerdata,
      plot(powerdata$datetime,
      powerdata$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)") )

dev.off()

writeLines("...plot complete")