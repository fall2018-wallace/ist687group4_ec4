
df <- data.frame(satisfactionSurvey, stringsAsFactors = FALSE)
str(df)
passengerdf <- df[c("Age","Gender","Year.of.First.Flight","No.of.Flights.p.a.","Shopping.Amount.at.Airport","Price.Sensitivity","Eating.and.Drinking.at.Airport")]

library(ggplot2)

#histogram of age
#People in the age group of 35 to 55 travel more frequently, peaking at 40
Age <- ggplot(passengerdf, aes(Age)) + geom_histogram(color="blue", fill="light blue")
Age
summary(passengerdf$Age)

#barplot for gender
#as.numeric...true=1, false=0
#The number of female passengers are more than males, since dummy variable 1 is assigned to females
passengerdf['GenderDummy'] <- as.numeric(passengerdf$Gender=="Female")
Gender <- ggplot(passengerdf,aes(GenderDummy)) + geom_bar(aes(color="blue", fill="light blue"))
Gender

#Histogram of number of flights 
#The overall flights that the customers have taken is not much. The graoh is a right skewed graph, mainly less than 25 flights
NoOfFlights <- ggplot(passengerdf, aes(No.of.Flights.p.a.))+ geom_histogram(color="blue", fill="light blue")
NoOfFlights


#Histogram of the amount of shopping done at the airport
#This data is right skewed and on an average, people spent between 0 to 100 dollars
ShoppingAmt <- ggplot(passengerdf, aes(Shopping.Amount.at.Airport))+ 
  geom_histogram(color="blue", fill="light blue") + 
  scale_x_continuous(limits = c(0,500)) +
  scale_y_continuous(limits = c(0,10000))
ShoppingAmt
summary(passengerdf$Shopping.Amount.at.Airport)
#The summary shows that more than 50% of the people do not spend any money shopping at the airport
#Few of the passengers, spend a lot of money, but they are mainly outliers


#Bar graph for Price Sensitivity
#The price sensitivity has a range from 0 to 5 which is the grade to which the price affects to customer's purchasing.
#Assuming that >2 indicates that passengers find the products at the airport expensive.
PriceSens <- ggplot(passengerdf, aes(Price.Sensitivity)) + geom_bar(color="blue", fill="light blue")
PriceSens
#Maximum grading is 1

#How often do passengers eat and drink at the airports
#Histogram for the Eating and drinking variable
EatingDrinking <- ggplot(passengerdf, aes(Eating.and.Drinking.at.Airport)) + 
  geom_bar()+
  scale_x_continuous(limits = c(0,300))
EatingDrinking
summary(passengerdf$Eating.and.Drinking.at.Airport)
max(passengerdf$Eating.and.Drinking.at.Airport)
#Most people have eaten at the airport atleast 30 to 90 times
