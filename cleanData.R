
# The Satisfaction variable is our dependent variable so it is important that it is 
# formatted correctly and that its values are measurable.

# Explore the unique entries in the Satisfaction column to discover any anomalies or 
# unexpected values not equal to a number between 0 and 5.
unique(satisfactionSurvey$Satisfaction)

# Per the above output, we see that there are some Satisfaction ratings of 4.00.5 and 
# 4.00.2.00 in the data which fall outside of our expected format and are non-numeric 
# (unable to be used in numerical analysis). As these are most likely errors, let's check
# to see how much of the data these errors affect.

# Display the number of rows with these anomalies
nrow(satisfactionSurvey[(satisfactionSurvey$Satisfaction=="4.00.2.00"|satisfactionSurvey$Satisfaction=="4.00.5"),])

# Display the total number of rows
nrow(satisfactionSurvey)

# Display the number of non-standard rows as a percentage of total rows
nrow(satisfactionSurvey[(satisfactionSurvey$Satisfaction=="4.00.2.00"|satisfactionSurvey$Satisfaction=="4.00.5"),]) / nrow(satisfactionSurvey) * 100

# Taking into account the fact that these numbers are unable to be analyzed as entered and
# that we can not be sure of what numbers they were intended to be, we now also see that 
# make up 3 out of 129889 (or 0.002%) of entries and wont' significantly influence overall 
# trends. Based upon this, our group has opted to remove them completely from the data set 
# before moving forward. 

# Remove the rows with non-numeric satisfaction ratings 
satisfactionSurvey <- satisfactionSurvey[(satisfactionSurvey$Satisfaction!="4.00.2.00"&satisfactionSurvey$Satisfaction!="4.00.5"),]

# Per Abhishek's exploratory analysis in delay_analysis.R and Rebecca's in 
# flight_information.R, there are some NULL values in Departure Delays, Arrival Delays and
# Flight Times (approximately 2400 instance or 1.5% of the data). In order to not miss out
# on other possibly valuable information in these rows, we will not remove them entirely 
# but create new columns that assign reasonable values where the data is missing.

# Create a dataframe that explores the relationship between cancelled flights and missing 
# delay and flight time data.

blankCounts <- c(nrow(satisfactionSurvey[satisfactionSurvey$Flight.cancelled=="Yes",]),
nrow(satisfactionSurvey[is.na(satisfactionSurvey$Departure.Delay.in.Minutes),]),
nrow(satisfactionSurvey[(is.na(satisfactionSurvey$Departure.Delay.in.Minutes)&satisfactionSurvey$Flight.cancelled=="Yes"),]),
nrow(satisfactionSurvey[is.na(satisfactionSurvey$Arrival.Delay.in.Minutes),]),
nrow(satisfactionSurvey[(is.na(satisfactionSurvey$Arrival.Delay.in.Minutes)&satisfactionSurvey$Flight.cancelled=="Yes"),]),
nrow(satisfactionSurvey[is.na(satisfactionSurvey$Flight.time.in.minutes),]),
nrow(satisfactionSurvey[(is.na(satisfactionSurvey$Flight.time.in.minutes)&satisfactionSurvey$Flight.cancelled=="Yes"),]))

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

# Create new columns that are based upon the data in Departure Delays, Arrival Delays and 
# Flight Time, but that set these values to zero where they are blank and where Flight 
# Cancelled is "Yes"

satisfactionSurvey$Departure.Delay.in.Minutes.0 <- ifelse (is.na(satisfactionSurvey$Departure.Delay.in.Minutes)&satisfactionSurvey$Flight.cancelled=="Yes", 0, satisfactionSurvey$Departure.Delay.in.Minutes)
satisfactionSurvey$Arrival.Delay.in.Minutes.0 <- ifelse (is.na(satisfactionSurvey$Arrival.Delay.in.Minutes)&satisfactionSurvey$Flight.cancelled=="Yes", 0, satisfactionSurvey$Arrival.Delay.in.Minutes)
satisfactionSurvey$Flight.time.in.minutes.0 <- ifelse (is.na(satisfactionSurvey$Flight.time.in.minutes)&satisfactionSurvey$Flight.cancelled=="Yes", 0, satisfactionSurvey$Flight.time.in.minutes)

# Note: the group will still need to decide what to do with the 338 instance where flights
# were not cancelled but Arrival Delay and Flight Time are still missing.


# We are missing values for Arrival Delay and Flight Time for flights that we know took place.
# To see if the data that we do have can be used to accurately estimate the missing values,
# we will run a linear regression on the missing variables and those related to them.

# Flight Time should be related to the distance travelled with variances occurring due to things 
# like head and tail winds, flight direction, etc. We'll use a linear model to see if these
# variables make a difference or if flight distance reamins a reasonable predictor of flight
# time in minutes.

predictFlightModel <- lm(formula = Flight.time.in.minutes ~ Flight.Distance, data = satisfactionSurvey)
summary(predictFlightModel)

# At 0.9542, the R-Squared is extremely close to 1 and at 2.2e-16, the p-value is very far 
# below 0.05 which together show that flight distance is reasonably good at predicting flight
# time and that the results are statistically significant. 

predictDelayModel <- lm(formula = Arrival.Delay.in.Minutes ~ Departure.Delay.in.Minutes, data = satisfactionSurvey)
summary(predictDelayModel)

# With an R-Squared of 0.9316 and a p-value of 2.2e-16, we see the same type of relationship
# between Departure Delay and Arrival Delay and can reasonably predict Arrival Delay data 
# from Departure Delay Data.

# Use the linear models from above to replace the NULL values for the dependent variables
# with estimated values
satisfactionSurvey$Arrival.Delay.in.Minutes.0.Est <- ifelse (is.na(satisfactionSurvey$Arrival.Delay.in.Minutes.0), 0.9787024*(satisfactionSurvey$Departure.Delay.in.Minutes) + 0.7733387, satisfactionSurvey$Arrival.Delay.in.Minutes.0)
satisfactionSurvey$Flight.time.in.minutes.0.Est <- ifelse (is.na(satisfactionSurvey$Flight.time.in.minutes.0), .1182*(satisfactionSurvey$Flight.Distance) + 17.47, satisfactionSurvey$Flight.time.in.minutes.0)

# I have left these unrounded for now so that we can distinguish them from the non-estimated
# values in case we have questions about their accuracy. We can round them if need be.
