
##################################################################
# Use this block comment at the top of each R code file you submit
# IST 687 Homework 8 – Submitted by Ryan French on October 25, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.

#import necessary libraries
myData <- satisfactionSurvey.csv
satisfactionSurvey <- read.csv(myData)
satisfactionSurvey$Satisfaction <- as.numeric(satisfactionSurvey$Satisfaction)



#Airline.Status
satisfactionSurvey$Airline.Status <- as.numeric(as.factor(satisfactionSurvey$Airline.Status))
plot(satisfactionSurvey$Airline.Status, satisfactionSurvey$Satisfaction)
modelStatus <- lm(formula = Satisfaction ~ Airline.Status, data = satisfactionSurvey)
summary(modelStatus)
#R-Squared: .1168
#Slope: <2e-16

#X..of.Flight.with.other.Airlines
plot(satisfactionSurvey$X..of.Flight.with.other.Airlines, satisfactionSurvey$Satisfaction)
modelOtherFlights <- lm(formula = Satisfaction ~ X..of.Flight.with.other.Airlines, data = satisfactionSurvey)
summary(modelOtherFlights)
#R-Squared: .004561
#Slope: <2e-16

#Airline.Code (Airline.Name)
satisfactionSurvey$Airline.Code <- as.numeric(as.factor(satisfactionSurvey$Airline.Code))
plot(satisfactionSurvey$Airline.Code, satisfactionSurvey$Satisfaction)
modelCode <- lm(formula = Satisfaction ~ Airline.Code, data = satisfactionSurvey)
summary(modelCode)
#R-Squared: 
#Slope: 

#No..of.other.Loyalty.Cards
satisfactionSurvey$Airline.Code <- as.numeric(as.factor(satisfactionSurvey$No..of.other.Loyalty.Cards))
plot(satisfactionSurvey$No..of.other.Loyalty.Cards, satisfactionSurvey$Satisfaction)
modelCards <- lm(formula = Satisfaction ~ No..of.other.Loyalty.Cards, data = satisfactionSurvey)
summary(modelCards)
#R-Squared: .007647
#Slope: 

#Class
plot(satisfactionSurvey$Class, satisfactionSurvey$Satisfaction)
modelClass <- lm(formula = Satisfaction ~ Class, data = satisfactionSurvey)
summary(modelClass)
#R-Squared: 
#Slope: 

#Type.of.Travel
plot(satisfactionSurvey$Type.of.Travel, satisfactionSurvey$Satisfaction)
modelTravelType <- lm(formula = Satisfaction ~ Type.of.Travel, data = satisfactionSurvey)
summary(modelTravelType)
#R-Squared: 
#Slope: 
