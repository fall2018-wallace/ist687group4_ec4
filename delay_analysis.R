
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
#First we explore the departure hour variable which contains the specific time for
#flight departure
summary(delay.df$Scheduled.Departure.Hour)
#SO it ranges from 1am to 23pm
#Further let's look at how this variable is distributed
h1 <- ggplot(aes(Scheduled.Departure.Hour),data = delay.df) +
  geom_histogram(binwidth = 1)

#We see most of our data has departure times between 5am and 8pm
#and generally this variable looks to be normally distributed

#Departure Delay in Minutes
#This variable indicates the delay for each flights in mins
summary(delay.df$Departure.Delay.in.Minutes)
#We see there are approx 2000 NAs in this variable and it looks to be right skewed
#There is also a huge difference between the third quartile and the maximum
#value hinting at the presence of outliers.

h2 <- ggplot(aes(Departure.Delay.in.Minutes),
             data = subset(delay.df,!is.na(delay.df$Departure.Delay.in.Minutes))) +
  geom_histogram()

#The plot confirms our surmise, as it is right skewed
#Hence some of the flights have delay for than 500mins
#we create another plot where we limit our x axis till the 98th percentile
#and also fix our y axis accordingly
h3 <- h2 + scale_x_continuous(limits = c(0,
                                         quantile(delay.df$Departure.Delay.in.Minutes,
                                                  probs = 0.98,na.rm = TRUE))) +
  scale_y_continuous(limits = c(0,10000))

#This gives a more clear picture showing the distribution of delay variable
#Mostly delay being less than an hour and with lesser flights with delay over an hour
#Let's see how many flights have a delay above 12 hrs i.e. half a day (720mins)
sum(delay.df$Departure.Delay.in.Minutes>720,na.rm = TRUE)
#we have 19 flights with delay more than 12 hours and one with delay more than a day
#which drives our histogram towards the right, these fligts can be flights
#which get re-scheduled for the next day which occurs rarely.

#A possible approach to tackle NAs can be to replace them with the most probable
#value which is 0min however this may not be the case

#Arrival Delay in Minutes
#Next we look at a similar variable which is arrival delay in mins 
summary(delay.df$Arrival.Delay.in.Minutes)
#Initial look shows us that this variable will have a similar distribution as 
#the previous as it looks right skewed and there are many NA values
#Let's further look at the plot

h4 <- ggplot(aes(Arrival.Delay.in.Minutes),
             data = subset(delay.df,!is.na(delay.df$Arrival.Delay.in.Minutes))) +
  geom_histogram() 
#A very similar distribution as departure delay, taking a closer look as before

h4 <- h4 + scale_x_continuous(limits = c(0,quantile(delay.df$Departure.Delay.in.Minutes,
                                                            probs = 0.98,na.rm = TRUE))) +
  scale_y_continuous(limits = c(0,10000))
#We can deduce similar conclusions as before about this variable.

#Flights cancelled
#Next looking at flights cancelled variable
unique(delay.df$Flight.cancelled)
#So we see flights cancelled is a categorical variable taking values 'YES' and 'NO'
#So we look at the proportion of delayed flights by transforming our variable
#into a dummy variable which can be further used for modelling as well
table(delay.df$Flight.cancelled)
delay.df['Flight.cancelled.dummy'] <- as.numeric(delay.df$Flight.cancelled=='Yes')
print(paste('Number of cancelled flights=',sum(delay.df$Flight.cancelled.dummy==1)))
#Thus there are around 2000 flights that have been cancelled
#However we have seen a similar number before
#These are the NA values may be related to previously encountered NAs in
#Arrival delay variable, let's check 
unique(delay.df[which(delay.df$Flight.cancelled=='Yes'),'Arrival.Delay.in.Minutes'])
sum(delay.df[which(delay.df$Flight.cancelled=='Yes'),'Arrival.Delay.in.Minutes'],na.rm = TRUE)
#The first command shows us the only values of delay for cancelled flights are 
#NA values the second command confirms this by showing 
#SO we see there are only NA values, which is intuitive as for a cancelled flight 
#delay variable doesn't make sense

sum(delay.df$Flight.cancelled.dummy==0)/length(delay.df$Flight.cancelled.dummy)
#so 98% of our data is for flights on time
#SO we can subset our data using delay while conducting regression analysis

#Arrival Delay greater 5 Mins
unique(delay.df$Arrival.Delay.greater.5.Mins)
#This is a categorical variable indicating if the delay is greater than 5mins
#which doesn't seem as useful as we already have the delay value for flights 
sum(delay.df$Arrival.Delay.greater.5.Mins=='no')/length(delay.df$Arrival.Delay.greater.5.Mins)
#65% of our data is has delay less than 5mins as observed earlier.

#Bivariate Analysis
#Exploring the satisfaction variable
summary(delay.df$Satisfaction)
#we see it is a character variable
unique(delay.df$Satisfaction)
#Further we see it takes two ambiguous values out of the range 1-5
#Cleaning Satisfaction variable
#Hence we remove these values and coerce it into a numerical variable for analysis
delay.df <- delay.df[(delay.df$Satisfaction!="4.00.2.00" & delay.df$Satisfaction!="4.00.5"),]
delay.df$Satisfaction <- as.numeric(as.character(delay.df$Satisfaction))

#Arrival Delay v/s Departure Delay
#As previously observed both the delay variables had a very similar distribution
#Thus we further look at how these variables are related by creating a scatter plot
s1 <- ggplot(aes(y=Arrival.Delay.in.Minutes,x=Departure.Delay.in.Minutes),
       data = delay.df)+
  geom_point()
#We see a strong linear relationship between the two as expected
#as if a flight's departure is delayed its arrival time is also affected
#this linear relationship can be highlighted as follows
s1 <- s1 + geom_smooth()
s1
#Next checing the correlation coefficicent
cor.test(delay.df$Departure.Delay.in.Minutes,delay.df$Arrival.Delay.in.Minutes)
#This confirms that these are higly correlated variables and both of them 
#need not be included in our model to avoid redundancy of data

#Further we look at how delay affects our satisfaction ratings by coloring
#the preious plot using the Satisfaction variable
s2 <- ggplot(aes(y=Arrival.Delay.in.Minutes,x=Departure.Delay.in.Minutes),
       data = delay.df)+
  geom_point(aes(color = Satisfaction))
s2
#However a clear trend cannot be observed here contrary to the expectation
#that higher delay time may result in low satisfaction value 
#This hints that customer satisfaction is not solely dependent on delay but
#also on other factors
#For eg. a customer may have higher delay but may be still satisfied due to 
#other reasons

#Model: Here we create a model which tries to predict customer satisfaction using 
#only delay variables
#First we subset our data to consider only flights which weren't cancelled
m.delay.df <- subset(delay.df,delay.df$Flight.cancelled=='No')
delay.model <- lm(Satisfaction ~ Scheduled.Departure.Hour+Departure.Delay.in.Minutes+
                    Arrival.Delay.in.Minutes, data = m.delay.df)
#Let's see how our model performs
summary(delay.model)
#As expected it doesn't perform well, as Adjusted R square is only 0.0075
#which was evident from the last plot itself

#Let's create another model with only one variable i.e. the departure delay
#as it is highly correlated to arrival delay we drop it, also
#from previous results we see that scheduled hour doesn't play a big role
#in predicting satisfaction
delay.model.2 <- lm(Satisfaction~Departure.Delay.in.Minutes,data = m.delay.df)
summary(delay.model.2)
#As expected our Adjusted R square doesn't drop a whole lot and hence this 
#variable may be considered as a key variable w.r.t delay
