
# The Satisfaction variable is our dependent variable so it is important that it is 
# formatted correctly and that its values are measurable.

# Explore the unique entries in the Satisfaction column to discover any anomolies or 
# unexpected values not equal to a number between 0 and 5.
unique(ssRaw$Satisfaction)

# Per the above analysis, we see that there are some Satisfaction ratings of 4.00.5 and 
# 4.00.2.00 in the data which fall outside of our expected format and are non-numeric 
# (unable to be used in numerical analysis). As these are most likely errors, let's check
# to see how much of the data these errors affect.

# Display the number of rows with these anomolies
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),])

# Display the total number of rows
nrow(ssRaw)

# Display the number of non-standard rows as a percentage of total rows
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),]) / nrow(ssRaw) * 100

# As these numbers are unable to be analyazed, we can not be sure of what numbers they 
# were intended to be and they make up 3 out of 129889 (or 0.002%) of entries and wont' 
# significantly influence overall trends, our group has opted to remove them completely 
# from the data set before moving forward. 

# Remove the rows with non-numeric satisfaction ratings 
ssCleanSat <- ssRaw[(ssRaw$Satisfaction!="4.00.2.00"&ssRaw$Satisfaction!="4.00.5"),]

# Per Abhishek's in in delay_analysis.R and Rebecca's exploratory analysis in 
# flight_information.R, there are some NULL values in Departure Delays, Arrival Delays and
# Flight Times (approximately 2000 instance or 1.5% of the data). In order to not miss out
# on other possibly valuable information in these rows, we will not remove them entirely 
# but create new columns that assigns reasonable values where the data is missing.

# Explore the relationship between cancelled flights and missing delay and flight time data.
nrow(ssRaw[is.na(ssRaw$Departure.Delay.in.Minutes),])
nrow(ssRaw[(is.na(ssRaw$Departure.Delay.in.Minutes)$Flight.cancelled=="Yes"),])
nrow(ssRaw[(is.na(ssRaw$Arrival.Delay.in.Minutes)$Flight.cancelled=="Yes"),])
nrow(ssRaw[(is.na(ssRaw$Flight.Distance)$Flight.cancelled=="Yes"),])



