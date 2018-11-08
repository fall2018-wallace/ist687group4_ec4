
library(ggplot2)

#Discritizing No..of.other.Loyalty.Cards, Eating.and.Drinking.at.Airport, Day.of.Month, Shopping.Amount.at.Airport attributes from th SatisfactionSurvey table
#discretize No..of.other.Loyalty.Cards
q <- quantile(ssClean$No..of.other.Loyalty.Cards, c(0.4, 0.6))
q
dloyalty <- replicate(length(ssClean$No..of.other.Loyalty.Cards), "Average")
dloyalty[ssClean$No..of.other.Loyalty.Cards <= q[1]] <- "Low"
dloyalty[ssClean$No..of.other.Loyalty.Cards > q[2]] <- "High"

#Discretize Shopping.Amount.at.Airport
q1 <- quantile(df$Shopping.Amount.at.Airport, c(0.4, 0.6))
q1
dShopping <- replicate(length(df$Shopping.Amount.at.Airport), "Average")
dShopping[df$Shopping.Amount.at.Airport < q1[1]] <- "Low"
dShopping[df$Shopping.Amount.at.Airport > q1[2]] <- "High"

#discretize Eating and Drinking
q2 <- quantile(df$Eating.and.Drinking.at.Airport, c(0.4, 0.6))
q2
dEating <- replicate(length(df$Eating.and.Drinking.at.Airport), "Average")
dEating[df$Eating.and.Drinking.at.Airport < q2[1]] <- "Low"
dEating[df$Eating.and.Drinking.at.Airport > q2[2]] <- "High"

#discretize Day of Month
dDayOfMonth <- replicate(length(df$Day.of.Month), "Average")
dDayOfMonth[df$Day.of.Month < '15'] <- "Low"
dDayOfMonth[df$Day.of.Month > '15'] <- "High"

dSatisfactionSurveyPart2 <- data.frame(dloyalty, dShopping, dEating, dDayOfMonth)
head(dSatisfactionSurveyPart2)

