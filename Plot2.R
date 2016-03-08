## Read raw data
raw_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Filter data
data <- subset(raw_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Transform dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot Result
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")