library(ggplot2)
data(diamonds)
View(diamonds)
library(esquisse)
esquisse::esquisser(data = diamonds, viewer = "browser")
library(ggplot2)
ggplot(
  data = diamonds,
  mapping = aes(x = carat, y = price, colour = color)
  ) +
  geom_point(shape = "circle", size = 1.5) +
  geom_smooth(span = 0.75) +
  scale_color_hue(direction = 1) +
  theme_minimal()

# create graph one containing colors "J", "H", and "F"
# load ggplot2 and dplyr
library(ggplot2)
library(dplyr)
#filter the data to isolate only the rows with the specified colors
diamonds %>%
  filter(color %in% c("J", "H", "F")) %>%
  
  #plot the filtered data by declaring the variables
  ggplot(
    mapping = aes(x = carat, y = price, colour = color)
  )+
  
  #assign sizes to the points and line of best fit
  geom_point(shape = "circle", size = 1.5) +
  geom_smooth(span = 0.75, se = FALSE) +
  
  #assign a color to each color and create the legend
  scale_color_manual(
    values = c(F = "#E40A0A",
               H = "#20AFEC",
               J = "#000000")
  ) +
  
  # add titles and labels
  labs(
    x = "Weight of Diamond in Carats ",
    y = "Price of Diamond ($)",
    title = "Price of Diamond vs. Weight(Carats) and Color"
  ) +
  theme_minimal()


#create graph 2 containing colors "E", "I", "G", "D"
#load ggplot and dplyr
library(ggplot2)
library(dplyr)
#filter the data for the specified colors
diamonds_data <- diamonds %>%
  filter(!(color %in% c("J", "H", "F"))) %>%
  
  #plot the line graph and define the variables
  ggplot(
    mapping = aes(x = carat, y = price, colour = color)
  )+
  
  #assign sizes to the points and line of best fit
  geom_point(shape = "circle", size = 1.5) +
  geom_smooth(span = 0.5, se = FALSE) +
  
  #assign colors to each color group
  scale_color_manual(
    values = c(D = "#12B501",
               E = "#DC0C0C",
               G = "#000000",
               I = "#20AFEC")
  ) +
  
  #add titles and labels
  labs(
    x = "Weight of Diamond in Carats",
    y = "Price of Diamond ($)",
    title = "Price of Diamond vs Weight (Carats) and Color"
  ) +
  theme_minimal()

#fix the scaling so that there is no data points beyond the graph labels
diamonds_data + ylim(0,20000)