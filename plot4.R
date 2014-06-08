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
par(mfrow=c(2,2)) # Plot will have figures in 2 rows x 2 columns  

#Create the first plot
plot(df.sub$DateTime, df.sub$Global_active_power, # create plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "", # making the x-axis label blank
     ylab = "Global Active Power") # y-axis label

#Create the second plot
plot(df.sub$DateTime, df.sub$Voltage, # create plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "datetime", # x-axis label
     ylab = "Voltage") # y-axis label

#Create third plot
plot(df.sub$DateTime, df.sub$Sub_metering_1, # create first series in plot
     type = "l", # type should be line plot
     xlab = "", # x-axis title should be blank
     ylab = "Energy sub metering", # y-axis label
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label size according to spec
     col = "black") # colour the line black
lines(df.sub$DateTime, df.sub$Sub_metering_2, # create second series in plot
      col = "red") # colour the line red 
lines(df.sub$DateTime, df.sub$Sub_metering_3, # create third series in plot
      col = "blue") # colour the line red 
legend('topright', # position legend in top right corner
       names(df.sub)[7:9], # apply names from data frame column names
       lty = 1, # make solid lines for each element of the legend
       col = c("black", "red", "blue"), # colour the lines according to spec
       cex = 0.60, # reduce font size according to spec
       y.intersp = 0.70, # set line spacing according to spec
       bty = "n", # no outline
       lwd = 1.5) # make line slightly wider

#Create the fourth plot
plot(df.sub$DateTime, df.sub$Global_reactive_power, # create plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "datetime", # x-axis label
     ylab = "Global_reactive_power") # y-axis label

dev.copy(png, file = "plot4.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device
