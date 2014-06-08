# Set working directory and import data
setwd("~/ExploratoryAnalysis") 
df <- read.csv("~/ExploratoryAnalysis/household_power_consumption.txt", sep=";", na.strings = "?") 

# load lubridate package for character to date conversion
library("lubridate")

# Convert date and time to date/time formats
df$Date <- as.Date(df$Date, "%d/%m/%Y") # Convert Date from character to date format
df$DateTime <- paste(df$Date, df$Time, sep=" ") # Concatentate date and time vars 
df$DateTime <- ymd_hms(df$DateTime) # Convert from character to date format


#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
df.sub <- subset.data.frame(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

#Create a plot
plot(df.sub$DateTime, df.sub$Global_active_power, # create plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "", # making the x-axis blank
     ylab = "Global Active Power (kilowatts)") # y-axis label

dev.copy(png, file = "plot2.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device
