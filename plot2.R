# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Exploratory Data Analysis
# Project 1
###############################################################

filename <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

# download dataset file if does not exist
if(!file.exists(filename)){
  datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(datasetURL, destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip")}
# unzip dataset if not yet unzipped
if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")}

# read data
consumption <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, dec=".", na="?", colClasses = c("character", "character", rep("numeric",7)))

# subset data to required time period
subdata <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
str(subdata)  # check variable types

subdata$Datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
str(subdata)  # confirm variable types


## PLOT 2
plot(subdata$Datetime, subdata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=550, width=550)
dev.off()