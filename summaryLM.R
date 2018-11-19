
# Create a linear model with all applicable variables
summaryModel <- summary(lm(formula = SatisfactionNumeric ~ Airline.Status + Age + Gender + 
    Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. + X..of.Flight.with.other.Airlines +
    Type.of.Travel + No..of.other.Loyalty.Cards + Shopping.Amount.at.Airport + 
    Eating.and.Drinking.at.Airport + Class + Day.of.Month + Flight.date + Airline.Code + Airline.Name +
    Orgin.City + Origin.State + Destination.City + Destination.State + Scheduled.Departure.Hour + 
    Departure.Delay.in.Minutes.0 + Arrival.Delay.in.Minutes.0.Est + Flight.cancelled + 
    Flight.time.in.minutes.0.Est + Flight.Distance + Arrival.Delay.greater.5.Mins, 
    data = cleanSatisfactionSurvey))
# summaryModel

# These were not applicable or too specialized
# Orgin.City + Origin.State + Destination.City + Destination.State + Flight.date + Airline.Name

# These were not statistically significant or less significant
# X..of.Flight.with.other.Airlines + No..of.other.Loyalty.Cards + Eating.and.Drinking.at.Airport +
# Day.of.Month + Airline.Code + Departure.Delay.in.Minutes.0 + Arrival.Delay.in.Minutes.0.Est + 
# Flight.time.in.minutes.0.Est + Flight.Distance

# Re-run the linear model with the statistically significant variables
summaryModel2 <- summary(lm(formula = SatisfactionNumeric ~ Airline.Status + Age + Gender + 
    Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. + Type.of.Travel  + 
    Shopping.Amount.at.Airport + Class + Scheduled.Departure.Hour + Flight.cancelled + 
    Arrival.Delay.greater.5.Mins, data = cleanSatisfactionSurvey))
summaryModel2
