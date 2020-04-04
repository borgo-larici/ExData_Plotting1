# Code for generating plot2.png.
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
        filename = "plot2.png",
        width = 480, # This is the default value anyway, but providing
        height = 480 # it here for clarity
)

# Draw the histogram into the "png" graphics device.
with(
        epc, # use data from "epc"
        plot(
                epcDate,                                 # X-axis value
                Global_active_power,                     # Y-axisvalue
                type = "l",                              # Plot lines
                xlab = "",                               # Suppress X label
                ylab = "Global Active Power (kilowatts)" # Customize Y label
        )
)
     
# Close the "png" graphics device.
dev.off()
