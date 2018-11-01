
# We are missing values for Arrival Delay and Flight Time for flights that we know took place.
# To see if the data that we do have can be used to accurately estimate the missing values,
# we will run a linear regression on the missing variables and those related to them.

# Flight Time should be related to the distance travelled with variances occurring due to things 
# like head and tail winds, flight direction, etc. We'll use a linear model to see if these
# variables make a difference or if flight distance reamins a reasonable predictor of flight
# time in minutes.

predictFlightModel <- lm(formula = Flight.time.in.minutes ~ Flight.Distance, data = ssClean)
summary(predictFlightModel)

# At 0.9542, the R-Squared is extremely close to 1 and at 2.2e-16, the p-value is very far 
# below 0.05 which together show that flight distance is reasonably good at predicting flight
# time and that the results are statistically significant. 

predictDelayModel <- lm(formula = Arrival.Delay.in.Minutes ~ Departure.Delay.in.Minutes, data = ssClean)
summary(predictDelayModel)

# With an R-Squared of 0.9316 and a p-value of 2.2e-16, we see the same type of relationship
# between Departure Delay and Arrival Delay and can reasonably predict Arrival data from
