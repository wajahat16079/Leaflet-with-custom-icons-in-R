
## Packages required 
library(leaflet)
library(tidyverse)


## Loading data
data = read.csv("community.csv")

str(data)

data$Lat = data$Lat %>% as.numeric()
data = data %>% na.omit()
data = data[1:100,]


## Creating a column for icon
data$Icon = "school"
data$Icon[1:25] = "house"
data$Icon[26:50] = "ambulance"
data$Icon[51:75] = "restaurant"




## Creating Icon Object
IconWidthHeight = 30

house <- makeIcon(
  iconUrl = "house.png",
  iconWidth = IconWidthHeight*1.2, iconHeight = IconWidthHeight
)

school <- makeIcon(
  iconUrl = "school.png",
  iconWidth = IconWidthHeight*1.2, iconHeight = IconWidthHeight
)

ambulance<- makeIcon(
  iconUrl = "ambulance.png",
  iconWidth = IconWidthHeight*1.2, iconHeight = IconWidthHeight
)

restaurant <- makeIcon(
  iconUrl = "restaurant.png",
  iconWidth = IconWidthHeight*1.2, iconHeight = IconWidthHeight
)




leaflet() %>% 
  addTiles()%>%
  addMarkers(data$Lon[data$Icon == "school"], data$Lat[data$Icon == "school"], label = data$Icon[data$Icon == "school"], icon = school) %>%
  addMarkers(data$Lon[data$Icon == "house"], data$Lat[data$Icon == "house"], label = data$Icon[data$Icon == "house"], icon = house) %>%
  addMarkers(data$Lon[data$Icon == "ambulance"], data$Lat[data$Icon == "ambulance"], label = data$Icon[data$Icon == "ambulance"], icon = ambulance)%>% 
  addMarkers(data$Lon[data$Icon == "restaurant"], data$Lat[data$Icon == "restaurant"], label = data$Icon[data$Icon == "restaurant"], icon = house) 




