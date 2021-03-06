# This code downloads the data set and constructs the first plot for 
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

# Construct the plot and save it in plot1.png
png(file = "plot1.png")
hist(as.numeric(data$Global_active_power), col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()