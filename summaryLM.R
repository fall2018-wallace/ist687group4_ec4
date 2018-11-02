
# Create a linear model with all applicable variables
summaryModel <- summary(lm(formula = SatisfactionNumeric ~ Airline.Status + Age + Gender + Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. + X..of.Flight.with.other.Airlines +
  Type.of.Travel + No..of.other.Loyalty.Cards + Shopping.Amount.at.Airport + Eating.and.Drinking.at.Airport +
  Class + Day.of.Month + Airline.Code + Scheduled.Departure.Hour + Departure.Delay.in.Minutes + Arrival.Delay.in.Minutes +
  Flight.Distance + Arrival.Delay.greater.5.Mins + Flight.time.in.minutes, data = cleanSatisfactionSurvey))

# These were not applicable
# Orgin.City + Origin.State + Destination.City + Destination.State + Flight.date + Airline.Name

# This produced an error that we should look into
# Flight.cancelled
