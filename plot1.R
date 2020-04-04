# Code for generating plot1.png.
# Part of Course Project 1 for "Explorator Data Analysis"

# First, get the necessary data into object "epc".

# Rather than repeating the same code four times in four files,
# I put the code for downloading, unzipping, loading and transforming the
# raw data into a script "getEPC.R" 

# Source this script now.
source("getEPC.R")

# We now have a function "getEPC" that will download, unzip, load and
# transform the raw data into the object "epc" used for plotting.

# Populate "epc"
epc <- getEPC()

# Open the "png" graphics device
png(
        filename = "plot1.png",
        width = 480, # This is the default value anyway, but providing
        height = 480 # it here for clarity
)

# Draw the histogram into the "png" graphics device.
hist(
        epc$Global_active_power,                  # The var. we are plotting
        col = "red",                              # Color = red
        main = "Global Active Power",             # Main title
        xlab = "Global Active Power (kilowatts)" # X-axis title
)

# Close the "png" graphics device.
dev.off()
