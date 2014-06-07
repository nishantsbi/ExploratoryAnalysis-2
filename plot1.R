# Set working directory and import data
setwd("~/ExploratoryAnalysis") 
df <- read.csv("~/ExploratoryAnalysis/household_power_consumption.txt", sep=";", na.strings = "?") 

# Convert date and time to date/time formats
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
df.sub <- subset.data.frame(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

with(df.sub, hist(Global_active_power, # create histogram, with plotting variable in thousands
                  col = "red",  # make bars red
                  main = "Global Active Power", # add title
                  xlab = "Global active power (kilowatts)")) # add x-axis label

dev.copy(png, file = "plot1.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device
