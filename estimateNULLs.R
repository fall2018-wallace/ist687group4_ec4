
# We are missing values for Arrival Delay and Flight Time for flights that we know took place.
predictModel <- lm(formula = Flight.time.in.minutes ~ Flight.Distance, data = ssClean)
summary(predictModel)
