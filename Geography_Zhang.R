
#Load the datasets
getwd() 
sSurvey <-read.csv("satisfactionSurvey.csv",TRUE,",") #read in the file
str(sSurvey)
#create new dataframe satisfaction surveyGep with 5 variables 
#surveyGeo<-sSurvey [,-c(2:17,22:28)] 
surveyGeo<-sSurvey [,c("Satisfaction","Orgin.City","Origin.State","Destination.City","Destination.State")]
str(surveyGeo)


#Explore the Satisfaction Variable 
length(surveyGeo$Satisfaction)
class(surveyGeo$Satisfaction)
surveyGeo$Satisfaction<-as.numeric(surveyGeo$Satisfaction)

#Insgtall ggplot packages 
library(ggplot2)
library(ggmap)
library(maps)

#Generate a color coded map
#Create a color coded map, based on the Origin State
us <- map_data("state")
surveyGeo$Origin.State<- tolower(surveyGeo$Origin.State)

colCoMap <- ggplot(surveyGeo, aes(map_id =Origin.State))  
colCoMap <- colCoMap+  geom_map(map = us, aes(fill=surveyGeo$Satisfaction)) 
colCoMap <- colCoMap + expand_limits(x = us$long, y = us$lat)
colCoMap <- colCoMap + coord_map() +ggtitle ("Map of the Origine State")
colCoMap 

#Create a color coded map, based on the Destination State
surveyGeo$Destination.State<- tolower(surveyGeo$Destination.State)
colCoMap <- ggplot(surveyGeo, aes(map_id =Destination.State))  
colCoMap <- colCoMap +  geom_map(map = us, aes(fill=surveyGeo$Satisfaction)) 
colCoMap <- colCoMap + expand_limits(x = us$long, y = us$lat)
colCoMap <- colCoMap + coord_map() + ggtitle("Map of Destination State")
colCoMap

