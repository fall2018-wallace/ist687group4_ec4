
# ssClean[,c(22:24, 25, 26)]
# library (ggplot2)

# Discretize: Scheduled.Departure.Hour, Departure.Delay.in.Minutes, Arrival.Delay.in.Minutes,
# Flight.time.in.minutes, Flight.Distance for use in future mining

# str(satisfactionSurvey)

# Create a discretization function

defineBucketQuantiles <- function(inputVector)
{
  q <- quantile(inputVector, c(0.4, 0.6))
  vBuckets <- replicate(length(inputVector), "Average") # Create a vector of the right length with a default value
  vBuckets[inputVector > q[2]] <- "High" # Assign instances above the 60% quartile to "High"
  vBuckets[inputVector <= q[1]] <- "Low" # Assign instances in the lowest 40% to "Low" 
  return(vBuckets) # Anything not assigned to "High" or "Low" will retain default value ("Average")
}

dHour <- defineBucketQuantiles(ssClean$Scheduled.Departure.Hour)
dDepDelay <- defineBucketQuantiles(ssClean$Departure.Delay.in.Minutes.0)
dArrDelay <- defineBucketQuantiles(ssClean$Arrival.Delay.in.Minutes.0.Est)
dTime <- defineBucketQuantiles(ssClean$Flight.time.in.minutes.0.Est)
dDistance <- defineBucketQuantiles(ssClean$Flight.Distance)


dSatisfactionSurveyPart3 <- data.frame(dHour, dDepDelay, dArrDelay, dTime, dDistance)
head(dSatisfactionSurveyPart3)
