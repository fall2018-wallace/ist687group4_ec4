
# ssClean[,c(22:24, 25, 26)]
# library (ggplot2)

# Discretize: Scheduled.Departure.Hour, Departure.Delay.in.Minutes, Arrival.Delay.in.Minutes,
# Flight.time.in.minutes, Flight.Distance for use in future mining

# str(satisfactionSurvey)

# Create a discretization function
hist(satisfactionSurvey$Age)
q <- quantile(satisfactionSurvey$Age, c(0.4, 0.6))
q
dAge <- replicate(length(satisfactionSurvey$Age), "Average")
dAge[satisfactionSurvey$Age <= q[1]] <- "Low"
dAge[satisfactionSurvey$Age > q[2]] <- "High"
#dAge

#discritize Price.Sensitivity
hist(satisfactionSurvey$Price.Sensitivity)
dPrice.Sensitivity <- replicate(length(satisfactionSurvey$Price.Sensitivity), "Average")
dPrice.Sensitivity[satisfactionSurvey$Price.Sensitivity < 1] <- "Low"
dPrice.Sensitivity[satisfactionSurvey$Price.Sensitivity > 1] <- "High"
#dPrice.Sensitivity

#discritize Year.of.First.Flight
hist(satisfactionSurvey$Year.of.First.Flight)
q <- quantile(satisfactionSurvey$Year.of.First.Flight, c(0.4, 0.6))
q
dYear.of.First.Flight <- replicate(length(satisfactionSurvey$Year.of.First.Flight), "Average")
dYear.of.First.Flight[satisfactionSurvey$Year.of.First.Flight <= q[1]] <- "Low"
dYear.of.First.Flight[satisfactionSurvey$Year.of.First.Flight > q[2]] <- "High"
#dYear.of.First.Flight

#discritize No.of.Flights.p.a.
hist(satisfactionSurvey$No.of.Flights.p.a.)
q <- quantile(satisfactionSurvey$No.of.Flights.p.a., c(0.4, 0.6))
q
dNo.of.Flights.p.a. <- replicate(length(satisfactionSurvey$No.of.Flights.p.a.), "Average")
dNo.of.Flights.p.a.[satisfactionSurvey$No.of.Flights.p.a. <= q[1]] <- "Low"
dNo.of.Flights.p.a.[satisfactionSurvey$No.of.Flights.p.a. > q[2]] <- "High"
#dNo.of.Flights.p.a.

#discritize X..of.Flight.with.other.Airlines
hist(satisfactionSurvey$X..of.Flight.with.other.Airlines)
q <- quantile(satisfactionSurvey$X..of.Flight.with.other.Airlines, c(0.4, 0.6))
q
dX..of.Flight.with.other.Airlines <- replicate(length(satisfactionSurvey$X..of.Flight.with.other.Airlines), "Average")
dX..of.Flight.with.other.Airlines[satisfactionSurvey$X..of.Flight.with.other.Airlines <= q[1]] <- "Low"
dX..of.Flight.with.other.Airlines[satisfactionSurvey$X..of.Flight.with.other.Airlines > q[2]] <- "High"
#dX..of.Flight.with.other.Airlines

dSatisfactionSurveyPart1 <- data.frame(dAge, dPrice.Sensitivity, dYear.of.First.Flight, dNo.of.Flights.p.a., dX..of.Flight.with.other.Airlines)
head(dSatisfactionSurveyPart1)
