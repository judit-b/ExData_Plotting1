# This code downloads the data set and constructs the fourth plot for 
# Course Project 1 of Exploratory Data Analysis course

# Download data and load it into data frame called "data"
# 1. Create a temporary file (temp)
# 2. Download the zip file into the temp file
# 3. Unzip the file and read it into variable "data"
# 4. Remove the temp file
pth <- "https://d396qusza40orc.cloudfront.net/"
fnm <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
url <- paste(pth, fnm, sep = "")

temp <- tempfile()
download.file(url, temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), sep= ";",
                   header = TRUE, stringsAsFactors = FALSE)
unlink(temp)

# Subset data set for the relevant dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


# Construct the plots and save it in plot4.png
png(file = "plot4.png")
par(mfcol = c(2, 2))

# First plot
plot(as.numeric(data$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# Second plot
plot(data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", 
     xaxt = 'n')
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
points(data$Sub_metering_1, type = "l")
points(data$Sub_metering_2, type = "l", col = "red")
points(data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), 
       bty = "n")

# Third plot
plot(as.numeric(data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage",
     xaxt = 'n')
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# Fourth plot
plot(as.numeric(data$Global_reactive_power), type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", xaxt = 'n')
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()