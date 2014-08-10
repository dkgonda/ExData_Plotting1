#plot1.R
#Loads data and creates plot1 from Projec Assignment 1 of
#Coursera's "Exploratory Data Analysis"
#(Aug 2014 session).
#
#script assumes that code file load_data.R is in the 
#working directory.
#
#png graphics file is written to working directory

source("load_data.R")

writeLines("creating plot1.png...")

png("plot1.png", width=480, height=480, units="px")

with(powerdata,
  hist( Global_active_power,
        breaks=12,
        col="red",
        main="Global Active Power",
        xlim=c(0,6),
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency",
        xaxp=c(0,6,2)) )

dev.off()

writeLines("...plot complete")
