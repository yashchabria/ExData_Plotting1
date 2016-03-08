## read raw data
raw_data <-read.csv("household_power_consumption.txt"  , header=TRUE, sep = ";")
## Transform date
raw_data$Date=as.Date(raw_data$Date,format="%d/%m/%Y")

## Filter data
hh_data=raw_data[raw_data$Date >'2007-01-31' & raw_data$Date < '2007-02-03',]

## Transform the column
hh_data$Global_active_power=as.numeric(hh_data$Global_active_power)

## plot the data 
hist(hh_data$Global_active_power, col = "blue", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")