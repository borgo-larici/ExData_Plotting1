# Function "getEPC"
# Used for Course Project 1 in "Exploratory Data Analysis".

# Checks if object "epc" exists already.
# If "epc" does not exist, downloads data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# to working directory.  Then unzips and 
# reads specific rows--want to include data from dates 2007-02-01 and 2007-02-02.
# Stores data in object "epc".
# Converts character-based date and time vars into Date/Time classes.




getEPC <- function() {
        # Return the existing "epc" object if exists
        if (exists("epc")) return(epc);
        
        # Execution continues here if "epc" object does not exist.
        
        # Download data
        download.file(
          "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
          "epc.zip"
        )
        
        # Unzip data
        unzip("epc.zip")
        
        # Read unzipped file "household_power_consumption.txt".
        # Omit lines that don't correspond to Feb. 1 and 2, 2007.
        epc <- read.csv(
                file = "household_power_consumption.txt",
                header = TRUE,
                sep = ";",
                col.names = c(
                        "DateText",
                        "TimeText",
                        "Global_active_power",
                        "Global_reactive_power",
                        "Voltage",
                        "Global_intensity",
                        "Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3"
                ),
                skip = 66636,
                nrows = 2880
        )
        
        # Create new "epcDate" vector by converting "DateText" column.
        epcDate = strptime(
                paste(
                        epc$DateText, 
                        epc$TimeText
                ), 
                format = "%d/%m/%Y %H:%M:%S"
        )
        
        # Output "epc" but with new "epcDate" vector prepended and the
        # text-based date/time columns removed.
        cbind(epcDate, epc[,3:9])
}
