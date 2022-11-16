library(palmerpenguins)
library(esquisse)
library(ggplot2)
esquisse::esquisser(data = penguins, viewer = "browser")
library(ggplot2)
library(palmerpenguins)
ggplot(
  data = penguins,
  mapping= aes(x = body_mass_g, y = species, colour = sex)
)+
  geom_boxplot(fill = "#112446") +
  scale_color_hue(direction = 1) +
  coord_flip() +
  theme_minimal()

#load the packages for ggplot, penguin data, and piping
library(ggplot2)
library(palmerpenguins)
library(dplyr)

#filter the data so that NA values are not included
penguins_data <-penguins %>%
  filter(!is.na(sex)) %>%
  
  #create the plot using ggplot and assign attributes
  ggplot(
    mapping = aes(x = species, y = body_mass_g, colour = sex) 
  )+
  
  #assign the box a fill color and use a scale on the color wheel to assign colors
  geom_boxplot(fill = "#000000") +
  scale_color_hue(direction = 1) +
  
  #add labels and titles to the graph 
  labs(
    x = "Penguin Species",
    y = "Body Mass (Grams)",
    title = "Body Mass of Male and Female Penguins vs Penguin Species ",
    color = "Sex"
  ) +
  theme_minimal()

#set the min and max on the y scale to ensure there are no data points outside the scale
  penguins_data + ylim(2000,7000)