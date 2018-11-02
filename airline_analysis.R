
##################################################################
# Use this block comment at the top of each R code file you submit
# IST 687 Homework 8 – Submitted by Ryan French on October 25, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.

#import necessary libraries
library(ggplot2)

satisfactionSurvey$Satisfaction <- as.numeric(satisfactionSurvey$Satisfaction)



#Airline.Status
#satisfactionSurvey$Airline.Status <- as.numeric(as.factor(satisfactionSurvey$Airline.Status))
#plot(satisfactionSurvey$Airline.Status, satisfactionSurvey$Satisfaction)
#modelStatus <- lm(formula = Satisfaction ~ Airline.Status, data = satisfactionSurvey)
#summary(modelStatus)
#R-Squared: .1168
#Slope: <2e-16

statusBar <- ggplot(satisfactionSurvey,aes(x=Airline.Status, y=Satisfaction, group=1))
statusBar <- statusBar + geom_col()
statusBar <- statusBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
statusBar

#Blue (lowest level) members have a signifcantly higher satisfaction rate



#X..of.Flight.with.other.Airlines
#plot(satisfactionSurvey$X..of.Flight.with.other.Airlines, satisfactionSurvey$Satisfaction)
#modelOtherFlights <- lm(formula = Satisfaction ~ X..of.Flight.with.other.Airlines, data = satisfactionSurvey)
#summary(modelOtherFlights)
#R-Squared: .004561
#Slope: <2e-16

otherFlightsBar <- ggplot(satisfactionSurvey,aes(x=X..of.Flight.with.other.Airlines, y=Satisfaction, group=1))
otherFlightsBar <- otherFlightsBar + geom_col()
otherFlightsBar <- otherFlightsBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
otherFlightsBar
#Satisfaction climbs up until 10 flights with other airlines and then hits a very sharp cutoff



#Airline.Code (Airline.Name)
#satisfactionSurvey$Airline.Code <- as.numeric(as.factor(satisfactionSurvey$Airline.Code))
#plot(satisfactionSurvey$Airline.Code, satisfactionSurvey$Satisfaction)
#modelCode <- lm(formula = Satisfaction ~ Airline.Code, data = satisfactionSurvey)
#summary(modelCode)
#R-Squared: 
#Slope: 

codesBar <- ggplot(satisfactionSurvey,aes(x=Airline.Code, y=Satisfaction, group=1))
codesBar <- codesBar + geom_col()
codesBar <- codesBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
codesBar
#WN has by far the highest satisfaction followed by DL, EV, OO, and AA at about half the amount



#No..of.other.Loyalty.Cards
#satisfactionSurvey$Airline.Code <- as.numeric(as.factor(satisfactionSurvey$No..of.other.Loyalty.Cards))
#plot(satisfactionSurvey$No..of.other.Loyalty.Cards, satisfactionSurvey$Satisfaction)
#modelCards <- lm(formula = Satisfaction ~ No..of.other.Loyalty.Cards, data = satisfactionSurvey)
#summary(modelCards)
#R-Squared: .007647
#Slope: 

cardsBar <- ggplot(satisfactionSurvey,aes(x=No..of.other.Loyalty.Cards, y=Satisfaction, group=1))
cardsBar <- cardsBar + geom_col()
cardsBar <- cardsBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
cardsBar
#No loyalty cards has significantly more satisfaction, steep dropoff afterwords



#Class
#plot(satisfactionSurvey$Class, satisfactionSurvey$Satisfaction)
#modelClass <- lm(formula = Satisfaction ~ Class, data = satisfactionSurvey)
#summary(modelClass)
#R-Squared: 
#Slope:

classBar <- ggplot(satisfactionSurvey,aes(x=Class, y=Satisfaction, group=1))
classBar <- classBar + geom_col()
classBar <- classBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
classBar
#Economy class has far and away the most satisfaction



#Type.of.Travel
#plot(satisfactionSurvey$Type.of.Travel, satisfactionSurvey$Satisfaction)
#modelTravelType <- lm(formula = Satisfaction ~ Type.of.Travel, data = satisfactionSurvey)
#summary(modelTravelType)
#R-Squared: 
#Slope: 

travelBar <- ggplot(satisfactionSurvey,aes(x=Type.of.Travel, y=Satisfaction, group=1))
travelBar <- travelBar + geom_col()
travelBar <- travelBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
travelBar

#Business travel corresponds with significantly more satisfaction
