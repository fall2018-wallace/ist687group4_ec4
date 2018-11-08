
library(ggplot2)

#Discritize:Age, Price Sensitivity, Year of First Flight, Number of Flights, No of flights with other airlines
#str(satisfactionSurvey)

#discritize Age
histAge <- hist(ssClean$Age)
q <- quantile(ssClean$Age, c(0.4, 0.6))
q
dAge <- replicate(length(ssClean$Age), "Average")
dAge[ssClean$Age <= q[1]] <- "Low"
dAge[ssClean$Age > q[2]] <- "High"
#dAge

#discritize Price.Sensitivity
histPrice <- hist(ssClean$Price.Sensitivity)
dPrice.Sensitivity <- replicate(length(ssClean$Price.Sensitivity), "Average")
dPrice.Sensitivity[ssClean$Price.Sensitivity < 1] <- "Low"
dPrice.Sensitivity[ssClean$Price.Sensitivity > 1] <- "High"
#dPrice.Sensitivity

#discritize Year.of.First.Flight
histFirstFlight <- hist(ssClean$Year.of.First.Flight)
q <- quantile(ssClean$Year.of.First.Flight, c(0.4, 0.6))
q
dYear.of.First.Flight <- replicate(length(ssClean$Year.of.First.Flight), "Average")
dYear.of.First.Flight[ssClean$Year.of.First.Flight <= q[1]] <- "Low"
dYear.of.First.Flight[ssClean$Year.of.First.Flight > q[2]] <- "High"
#dYear.of.First.Flight

#discritize No.of.Flights.p.a.
histNoFlights <- hist(ssClean$No.of.Flights.p.a.)
q <- quantile(ssClean$No.of.Flights.p.a., c(0.4, 0.6))
q
dNo.of.Flights.p.a. <- replicate(length(ssClean$No.of.Flights.p.a.), "Average")
dNo.of.Flights.p.a.[ssClean$No.of.Flights.p.a. <= q[1]] <- "Low"
dNo.of.Flights.p.a.[ssClean$No.of.Flights.p.a. > q[2]] <- "High"
#dNo.of.Flights.p.a.

#discritize X..of.Flight.with.other.Airlines
histFlightsOther <- hist(ssClean$X..of.Flight.with.other.Airlines)
q <- quantile(ssClean$X..of.Flight.with.other.Airlines, c(0.4, 0.6))
q
dX..of.Flight.with.other.Airlines <- replicate(length(ssClean$X..of.Flight.with.other.Airlines), "Average")
dX..of.Flight.with.other.Airlines[ssClean$X..of.Flight.with.other.Airlines <= q[1]] <- "Low"
dX..of.Flight.with.other.Airlines[ssClean$X..of.Flight.with.other.Airlines > q[2]] <- "High"
#dX..of.Flight.with.other.Airlines

dSatisfactionSurveyPart1 <- data.frame(dAge, dPrice.Sensitivity, dYear.of.First.Flight, dNo.of.Flights.p.a., dX..of.Flight.with.other.Airlines)
head(dSatisfactionSurveyPart1)

