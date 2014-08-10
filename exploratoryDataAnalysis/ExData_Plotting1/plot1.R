## Creates the plot after reading the data from the
## file that contains the "Individual household electric
## power consumption Data Set"

  setwd("C:/Users/Nixon/Documents/GitHub/nixonpatel/exploratoryDataAnalysis")
  allData <- read.csv("./ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

## Subsetting the data
  partialData <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(allData)

## Converting dates
  datetime <- paste(as.Date(partialData$Date), partialData$Time)
  partialData$Datetime <- as.POSIXct(datetime)

## Plot 1
  hist(partialData$Global_active_power, main="Global Active Power", 
           xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
