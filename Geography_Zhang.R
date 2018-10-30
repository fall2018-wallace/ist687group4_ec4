
#Group Project Zefeng Zhang Geography  

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
us <- map_data("state")
surveyGeo$Origin.State<- tolower(surveyGeo$Origin.State)

oStateMap <- ggplot(surveyGeo, aes(map_id =Origin.State))  
oStateMap <- oStateMap+  geom_map(map = us, aes(fill=surveyGeo$Satisfaction)) 
oStateMap <- oStateMap + expand_limits(x = us$long, y = us$lat)
oStateMap <- oStateMap + coord_map() +ggtitle ("Map of the Origine State")
oStateMap

#Create a color coded map, based on the Destination State
surveyGeo$Destination.State<- tolower(surveyGeo$Destination.State)
dStateMap <- ggplot(surveyGeo, aes(map_id =Destination.State))  
dStateMap <- dStateMap +  geom_map(map = us, aes(fill=surveyGeo$Satisfaction)) 
dStateMap <- dStateMap + expand_limits(x = us$long, y = us$lat)
dStateMap <- dStateMap + coord_map() + ggtitle("Map of Destination State")
dStateMap
