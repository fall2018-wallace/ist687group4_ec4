
#Load the datasets
getwd() 
sSurvey <-read.csv("satisfactionSurvey.csv",TRUE,",") #read in the file
str(sSurvey) 

#create new dataframe satisfaction surveyGep with 5 variables 
surveyGeo<-sSurvey [,c("Satisfaction","Orgin.City","Origin.State","Destination.City","Destination.State")]
str(surveyGeo)

#Clean the satisfaction coloum 
typeof(surveyGeo$Satisfaction) 
surveyGeo$Satisfaction<-as.numeric(as.character(surveyGeo$Satisfaction))
summary(surveyGeo$Satisfaction)
unique(surveyGeo$Satisfaction)
#Remove 3 NAs 
surveyGeo <- surveyGeo[!is.na(surveyGeo$Satisfaction),]  

#Insgtall ggplot packages 
library(ggplot2)
library(ggmap)
library(maps)

#Generate a color coded map
#Create a color coded map, based on the Origin State
library(dplyr)
map_origin <- surveyGeo %>% 
  group_by(Origin.State) %>% 
  summarise(average_sat=mean(Satisfaction))
  
us <- map_data("state")
map_origin$Origin.State<- tolower(map_origin$Origin.State)

oStateMap <- ggplot(map_origin, aes(map_id =map_origin$Origin.State))  
oStateMap <- oStateMap+geom_map(map = us, aes(fill=map_origin$average_sat)) 
oStateMap <- oStateMap+expand_limits(x = us$long, y = us$lat)
oStateMap <- oStateMap+coord_map() +ggtitle ("Map of the Origine State")
oStateMap

ggplot(map_origin,aes (x=reorder(Origin.State,-average_sat),y=average_sat))+
  geom_col (fill="blue", color="black") + 
  theme(axis.text = element_text(angle = 90, hjust=1))

#Create a color coded map, based on the Destination State
map_destination <- surveyGeo %>% 
  group_by(Destination.State) %>% 
  summarise(average_sat=mean(Satisfaction))

us <- map_data("state")
map_destination$Destination.State<- tolower(map_destination$Destination.State)

oStateMap <- ggplot(map_destination, aes(map_id =map_destination$Destination.State))  
oStateMap <- oStateMap+geom_map(map = us, aes(fill=map_destination$average_sat)) 
oStateMap <- oStateMap+expand_limits(x = us$long, y = us$lat)
oStateMap <- oStateMap+coord_map() +ggtitle ("Map of the Destination State")
oStateMap

ggplot(map_destination,aes (x=reorder(Destination.State,-average_sat),y=average_sat))+
  geom_col (fill="purple", color="black") + 
  theme(axis.text = element_text(angle = 90, hjust=1))
