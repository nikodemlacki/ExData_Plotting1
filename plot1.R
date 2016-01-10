# Read data from file provided
hpcData <- read.csv("G:/Work/Coursera/Exploratory Analysis/household_power_consumption.txt", sep=";")
# Cast Date column to be a Date type instead of character factor
hpcData$Date <- as.Date(as.character(hpcData$Date), "%d/%m/%Y")
# Subset the main data set by extractin only 2 days as per instructions
hpcDataSubset<-subset(hpcData, (Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))))
# Remove the main data set to conserve memory
rm(hpcData)

# Draw the plot
png(filename = "plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

hpcDataSubset$Global_active_power <- as.numeric(as.character(hpcDataSubset$Global_active_power))
par("col", "red")
hist(hpcDataSubset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()



