#load_data.R
#
#Loads data from source url as part of  Projec Assignment 1 of
#Coursera's "Exploratory Data Analysis"
#(Aug 2014 session).
#If the final data file (or at least file with same name) already exists, 
#download and unzipping is skipped and existing file is used.
#
#Constructs a dataframe named "powerdata" from source 
#in which Date and Time attributes are consolidated into single
#datetime attribute and data is restricted to that of
#01-FEB-2007 and 02-FEB-2007.
# If a dataframe named powerdata
#
# attributes of final powerdata data frame:
# [1] datetime
# [2] Global_active_power
# [3] Global_reactive_power
# [4] Voltage
# [5] Global_intensity
# [6] Sub_metering_1
# [7] Sub_metering_2
# [8] Sub_metering_3

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download_filename <- "powerdata.zip"
unzipped_filename <- "household_power_consumption.txt"

#download zipped data and unzip it, 
#if the inzipped file does not already exist...
if (!file.exists(unzipped_filename))
{   download.file(url,download_filename)
    unzip(download_filename)
} else
{   writeLines(sprintf("File %s exists; skipping download and unzipping....",unzipped_filename))
}

#read in data and construct data set, 
#if not already present...
if (!exists("powerdata")) 
{  powerdata <- read.table(unzipped_filename,
                          header=TRUE,
                          sep=";",
                          stringsAsFactors=FALSE,
                          na.strings="?")
   dateTime <- strptime(paste(powerdata$Date,powerdata$Time),"%d/%m/%Y %H:%M:%S")
   powerdata$Date <- dateTime
   names(powerdata)[1] <- "datetime"
   powerdata$Time <- NULL
   powerdata <- subset(powerdata, as.Date("2007-02-01") <= as.Date(datetime) & as.Date(datetime) <= as.Date("2007-02-02"))
} else
{  writeLines("data frame \"powerdata\" already exists; skipping data load...")
}

#note: confirmed that the range of times subsetted 
#begins with 2007-02-01 00:00:00 
#and ends with 2007-02-02 23:59:00
