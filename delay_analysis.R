
df <- data.frame(ssdata,stringsAsFactors = FALSE)

#Initial look at NAs in our data
for(i in colnames(df)){
  print(paste(i,'=',sum(is.na(df[,i]))))
}
  

#Scheduled Departure Hour, Departure Delay in Minutes, Arrival Delay in Minutes, 
#Flight canceled, Arrival Delay greater 5 Mins 
#First we subset our data to just look at the variables which depict flight delay
#and how they affect our target variable i.e. 'Satisfaction'
delay.df <- df[,c('Satisfaction','Scheduled.Departure.Hour','Departure.Delay.in.Minutes',
                  'Arrival.Delay.in.Minutes','Flight.cancelled','Arrival.Delay.greater.5.Mins')]

library(ggplot2)

##Univariate Analysis

#Scheduled Departure Hour 
summary(delay.df$Scheduled.Departure.Hour)

h1 <- ggplot(aes(delay.df$Scheduled.Departure.Hour),data = delay.df) +
  geom_histogram(binwidth = 1)

#We see most of our data has flight information for flights between
#5am and 8pm

#Departure Delay in Minutes
summary(delay.df$Departure.Delay.in.Minutes)
#We see there are approx 2k NAs in this variable
#There is also a huge difference between the third quartile and the maximum
#value hinting at the presence of outliers.

h2 <- ggplot(aes(Departure.Delay.in.Minutes),
             data = subset(delay.df,!is.na(delay.df$Departure.Delay.in.Minutes))) +
  geom_histogram()

#The plot confirms our surmise, as it is right skewed
#we create another plot where we limit our x axis till the 98th percentile
#and also fix our y axis accordingly
h3 <- h2 + scale_x_continuous(limits = c(0,
                                         quantile(delay.df$Departure.Delay.in.Minutes,
                                                  probs = 0.98,na.rm = TRUE))) +
  scale_y_continuous(limits = c(0,10000))
h3
#This gives a more clear picture showing the distribution of delay variable
#Mostly delay being less than an hour and with lesser flights with delay over an hour
#Let's see how many flights have a delay above 12 hrs i.e. a day (720mins)
sum(delay.df$Departure.Delay.in.Minutes>720,na.rm = TRUE)
#we have 19 flights with delay more than 12 hours and one with delay more than a day
#which drives our histogram towards the right

#Replace NAs with 0??


#Arrival Delay in Minutes
#Next we look at a similar variable which is arrival delay 
summary(delay.df$Arrival.Delay.in.Minutes)
#Initial look shows us that this variable will have a similar distribution as 
#the previous as it looks right skewed and there are many NA values

h4 <- ggplot(aes(Arrival.Delay.in.Minutes),
             data = subset(delay.df,!is.na(delay.df$Arrival.Delay.in.Minutes))) +
  geom_histogram() + scale_x_continuous(limits = c(0,
                                                   quantile(delay.df$Departure.Delay.in.Minutes,
                                                            probs = 0.98,na.rm = TRUE))) +
  scale_y_continuous(limits = c(0,10000))

h4
