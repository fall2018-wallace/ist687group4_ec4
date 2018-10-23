
df <- data.frame(ssdata,stringsAsFactors = FALSE)

#Scheduled Departure Hour, Departure Delay in Minutes, Arrival Delay in Minutes, 
#Flight canceled, Arrival Delay greater 5 Mins 
#First we subset our data to just look at the variables which depict flight delay
#and how they affect our target variable i.e. 'Satisfaction'
delay.df <- df[,c('Satisfaction','Scheduled Departure Hour','Departure Delay in Minutes',
                'Arrival Delay in Minutes','Flight canceled','Arrival Delay greater 5 Mins')]

library(ggplot2)

##Univariate Analysis
#Scheduled Departure Hour
