# Read data from file provided
hpcData <- read.csv("G:/Work/Coursera/Exploratory Analysis/household_power_consumption.txt", sep=";")
# Cast Date column to be a Date type instead of character factor
hpcData$Date <- as.Date(as.character(hpcData$Date), "%d/%m/%Y")
# Subset the main data set by extractin only 2 days as per instructions
hpcDataSubset<-subset(hpcData, (Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))))
# Remove the main data set to conserve memory
rm(hpcData)

# Draw the plot
png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

hpcDataSubset$Global_active_power <- as.numeric(as.character(hpcDataSubset$Global_active_power))
hpcDataSubset$DateTime <- as.POSIXct(paste(hpcDataSubset$Date, hpcDataSubset$Time), format="%Y-%m-%d %H:%M:%S")

plot(hpcDataSubset$DateTime, hpcDataSubset$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab= "")

dev.off()
