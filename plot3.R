# Read data from file provided
hpcData <- read.csv("G:/Work/Coursera/Exploratory Analysis/household_power_consumption.txt", sep=";")
# Cast Date column to be a Date type instead of character factor
hpcData$Date <- as.Date(as.character(hpcData$Date), "%d/%m/%Y")
# Subset the main data set by extractin only 2 days as per instructions
hpcDataSubset<-subset(hpcData, (Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))))
# Remove the main data set to conserve memory
rm(hpcData)

# Draw the plot
png(filename = "plot3.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

hpcDataSubset$DateTime <- as.POSIXct(paste(hpcDataSubset$Date, hpcDataSubset$Time), format="%Y-%m-%d %H:%M:%S")
hpcDataSubset$Sub_metering_1 <- as.numeric(as.character(hpcDataSubset$Sub_metering_1))
hpcDataSubset$Sub_metering_2 <- as.numeric(as.character(hpcDataSubset$Sub_metering_2))
hpcDataSubset$Sub_metering_3 <- as.numeric(as.character(hpcDataSubset$Sub_metering_3))
with(hpcDataSubset, plot(DateTime, Sub_metering_1, type = "n", ylab="Energy sub metering", xlab=""))
with(hpcDataSubset, lines(DateTime, Sub_metering_1, col="black"))
with(hpcDataSubset, lines(DateTime, Sub_metering_2, col="red"))
with(hpcDataSubset, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
