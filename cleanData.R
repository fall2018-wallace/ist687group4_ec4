
# The Satisfaction variable is our dependent variable so it is important that it is 
# formatted correctly and that its values are measurable.

# Explore the unique entries in the Satisfaction column to discover any anomalies or 
# unexpected values not equal to a number between 0 and 5.
unique(ssRaw$Satisfaction)

# Per the above output, we see that there are some Satisfaction ratings of 4.00.5 and 
# 4.00.2.00 in the data which fall outside of our expected format and are non-numeric 
# (unable to be used in numerical analysis). As these are most likely errors, let's check
# to see how much of the data these errors affect.

# Display the number of rows with these anomalies
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),])

# Display the total number of rows
nrow(ssRaw)

# Display the number of non-standard rows as a percentage of total rows
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),]) / nrow(ssRaw) * 100

# Taking into account the fact that these numbers are unable to be analyzed as entered and
# that we can not be sure of what numbers they were intended to be, we now also see that 
# make up 3 out of 129889 (or 0.002%) of entries and wont' significantly influence overall 
# trends. Based upon this, our group has opted to remove them completely from the data set before moving forward. 

# Remove the rows with non-numeric satisfaction ratings 
ssClean <- ssRaw[(ssRaw$Satisfaction!="4.00.2.00"&ssRaw$Satisfaction!="4.00.5"),]

# Per Abhishek's exploratory analysis in delay_analysis.R and Rebecca's in 
# flight_information.R, there are some NULL values in Departure Delays, Arrival Delays and
# Flight Times (approximately 2000 instance or 1.5% of the data). In order to not miss out
# on other possibly valuable information in these rows, we will not remove them entirely 
# but create new columns that assigns reasonable values where the data is missing.

# Explore the relationship between cancelled flights and missing delay and flight time data.

blankCounts <- c(nrow(ssRaw[ssRaw$Flight.cancelled=="Yes",]),
nrow(ssRaw[is.na(ssRaw$Departure.Delay.in.Minutes),]),
nrow(ssRaw[(is.na(ssRaw$Departure.Delay.in.Minutes)&ssRaw$Flight.cancelled=="Yes"),]),
nrow(ssRaw[is.na(ssRaw$Arrival.Delay.in.Minutes),]),
nrow(ssRaw[(is.na(ssRaw$Arrival.Delay.in.Minutes)&ssRaw$Flight.cancelled=="Yes"),]),
nrow(ssRaw[is.na(ssRaw$Flight.time.in.minutes),]),
nrow(ssRaw[(is.na(ssRaw$Flight.time.in.minutes)&ssRaw$Flight.cancelled=="Yes"),]))

measures <- c("Cancelled flights", "Departure Delays", 
"Departure Delays for Cancelled flights", "Arrival Delays", "Arrival Delays for Cancelled Flights",
"Flight Time", "Flight Time for Cancelled Flights")

dfBlankCounts <- data.frame(measures, blankCounts)
dfBlankCounts

# We can see that all of the blanks for Departure Delays are for flights that were cancelled 
# along with 88% (2401 out of 2738) of the blanks for Arrival Delays and Flight Time. Since
# a cancelled flight has no recorded time in the air and cannot land late by any amount of 
# time, we can reasonably set these instance to 0 for Arrival Delay and Flight Time. There 
# were less Departure Delays than total flights cancelled, presumably because a flight can 
# be delayed initially and also ultimately cancelled (after sitting on the tarmac). Still,
# it is reasonable to set the remaining blank Departure Delays to 0 where the flights were
# cancelled as an unreported delay on a flight that didn't fly most likely did not exist.

# Set Departure Delays, Arrival Delays and Flight Time to zero where they are blank and 
# where Flight Cancelled is "Yes"

ssClean$Departure.Delay.in.Minutes.0 <- ifelse (is.na(ssClean$Departure.Delay.in.Minutes)&ssClean$Flight.cancelled=="Yes", 0, ssClean$Departure.Delay.in.Minutes)
ssClean$Arrival.Delay.in.Minutes.0 <- ifelse (is.na(ssClean$Arrival.Delay.in.Minutes)&ssClean$Flight.cancelled=="Yes", 0, ssClean$Arrival.Delay.in.Minutes)
ssClean$Flight.time.in.minutes.0 <- ifelse (is.na(ssClean$Flight.time.in.minutes)&ssClean$Flight.cancelled=="Yes", 0, ssClean$Flight.time.in.minutes)

