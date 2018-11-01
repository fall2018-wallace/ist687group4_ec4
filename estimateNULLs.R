
# We are missing values for Arrival Delay and Flight Time for flights that we know took place.
# To see if the data that we do have can be used to accurately estimate the missing values,
predictModel <- lm(formula = Flight.time.in.minutes ~ Flight.Distance, data = ssClean)
summary(predictModel)
