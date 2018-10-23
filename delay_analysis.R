
df <- data.frame(ssdata,stringsAsFactors = FALSE)
head(df)

#Scheduled Departure Hour, Departure Delay in Minutes, Arrival Delay in Minutes, 
#Flight canceled, Arrival Delay greater 5 Mins 

delay.df <- df[,c('Satisfaction','Scheduled Departure Hour','Departure Delay in Minutes',Arrival Delay in Minutes, Flight canceled, Arrival Delay greater 5 Mins )]
