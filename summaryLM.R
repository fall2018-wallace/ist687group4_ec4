
# Create a linear model with all applicable variables
summaryModel <- summary(lm(formula = SatisfactionNumeric ~ Airline.Status + Age + Gender + Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. + X..of.Flight.with.other.Airlines +
  Type.of.Travel + No..of.other.Loyalty.Cards + Shopping.Amount.at.Airport + Eating.and.Drinking.at.Airport +
  Class + Scheduled.Departure.Hour+ Arrival.Delay.greater.5.Mins, data = cleanSatisfactionSurvey))

# These were not applicable
# Orgin.City + Origin.State + Destination.City + Destination.State + Flight.date + Airline.Name

# This produced an error that we should look into
# Flight.cancelled

# These were not significant 
# Airline.Code + Day.of.Month + Departure.Delay.in.Minutes + Arrival.Delay.in.Minutes + Flight.Distance +
# 

# Create a linear model with all applicable variables
summaryModel <- summary(lm(formula = SatisfactionNumeric ~ Airline.Status + Age + Gender + Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. + X..of.Flight.with.other.Airlines +
  Type.of.Travel + No..of.other.Loyalty.Cards + Shopping.Amount.at.Airport + Eating.and.Drinking.at.Airport +
  Class + Scheduled.Departure.Hour+ Arrival.Delay.greater.5.Mins, data = cleanSatisfactionSurvey))
