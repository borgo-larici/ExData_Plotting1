# Code for generating plot3.png.
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
        filename = "plot3.png",
        width = 480, # This is the default value anyway, but providing
        height = 480 # it here for clarity
)

# Draw the plot into the "png" graphics device.
plot(
        epc$epcDate,                   # X-axis data
        epc$Sub_metering_1,            # Y-axis data
        type = "n",                    # Create empty graph
        xlab = "",                     # Suppress X label
        ylab = "Energy sub metering"   # Customize Y label
)
lines(
        epc$epcDate,                   # X-axis data 
        epc$Sub_metering_1,            # Y-axis data
        col = "black"                  # Draw black lines
)
lines(
        epc$epcDate,                   # X-axis data
        epc$Sub_metering_2,            # Y-axis data
        col = "red"                    # Draw red lines
)
lines(
        epc$epcDate,                   # X-axis data
        epc$Sub_metering_3,            # Y-axis data
        col = "blue"                   # Draw blue lines
)
legend(                                # Add legend
        "topright", 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), 
        lty = 1
)

# Close the "png" graphics device.
dev.off()
