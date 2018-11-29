
#Creating factor variables for categorical 
df$Airline.Status <- factor(df$Airline.Status)
df$Gender <- factor(df$Gender)
df$Type.of.Travel <- factor(df$Type.of.Travel)
df$Class <- factor(df$Class)
df$Airline.Code <- factor(df$Airline.Code)
df$binarySat <- factor(df$binarySat)

#Here we use a similar approach as feature engg for regression
#the only difference being we do not convert categorical variables 
#into numeric since our tree can work with them
str(df)

df <- subset(df,df$X..of.Flight.with.other.Airlines<=100)
df <- subset(df,df$Flight.cancelled=="No")

#Airline.Status,Gender,Type.of.Travel,Class,Airline.Code,binarySat

df['Expenditure.at.Airport'] <- df$Shopping.Amount.at.Airport + 
  df$Eating.and.Drinking.at.Airport

df <- subset(df,select = -c(Satisfaction)) 
df <- subset(df,select = -c(Year.of.First.Flight)) 
df <- subset(df,select = -c(Flight.date)) 
df <- subset(df,select = -c(Shopping.Amount.at.Airport))
df <- subset(df,select = -c(Eating.and.Drinking.at.Airport))
df <- subset(df,select = -c(Airline.Name)) 
df <- subset(df,select = -c(Orgin.City))
df <- subset(df,select = -c(Destination.City))
df <- subset(df,select = -c(Origin.State))
df <- subset(df,select = -c(Destination.State))
df <- subset(df,select = -c(Flight.cancelled))
df <- subset(df,select = -c(Departure.Delay.in.Minutes.0))
df <- subset(df,select = -c(Flight.time.in.minutes))
df <- subset(df,select = -c(Flight.time.in.minutes.0))
df <- subset(df,select = -c(Arrival.Delay.in.Minutes))
df <- subset(df,select = -c(Arrival.Delay.in.Minutes.0))
df <- subset(df,select = -c(Arrival.Delay.greater.5.Mins))


names(df)[names(df) == 'Arrival.Delay.in.Minutes.0.Est'] <- 'Arrival.Delay.in.Minutes'
names(df)[names(df) == 'Flight.time.in.minutes.0.Est'] <- 'Flight.time.in.minutes'
names(df)[names(df) == 'SatisfactionNumeric'] <- 'Satisfaction'

str(df)
#Thus we are down to 19 variables (1 dependent) for forming our tree
