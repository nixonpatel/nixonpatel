## Creates the plot after reading the data from the
## file that contains the "Individual household electric
## power consumption Data Set"

## Set current working directory
  setwd("C:/Users/Nixon/Documents/GitHub/nixonpatel/exploratoryDataAnalysis")

## Extract all data
  allData <- read.csv("./ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

## Subsetting the data
  partialData <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(allData)

## Converting dates
  datetime <- paste(as.Date(partialData$Date), partialData$Time)
  partialData$Datetime <- as.POSIXct(datetime)

## Annotate Plot 3
  with(partialData, {
                    plot(Sub_metering_1~Datetime, type="l",
                    ylab="Global Active Power (kilowatts)", xlab="")
                    lines(Sub_metering_2~Datetime,col='Red')
                    lines(Sub_metering_3~Datetime,col='Blue')
      })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()