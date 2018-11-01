
# We are missing values for Arrival Delay and Flight Time for flights that we know took place.
# To see if the data that we do have can be used to accurately estimate the missing values,
# we will run a linear regression on the missing variables and those related to them.

# Flight Time should be related to the distance travelled with variances occurring due to things 
# like head and tail winds, flight direction, etc. We'll use a linear model to see if these
# variables make a difference or if flight distance reamins a reasonable predictor of flight
# time in minutes.
predictModel <- lm(formula = Flight.time.in.minutes ~ Flight.Distance, data = ssClean)
summary(predictModel)
