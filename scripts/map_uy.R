library(tidyverse)
# Load necessary libraries
library(maps)

# Create a map of Uruguay using the maps package
uruguay_map <- map_data("world", region = "Uruguay")

# Plot the map using ggplot2
ggplot(uruguay_map, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "lightgray", color = "black") +
  ggtitle("Map of Uruguay") +
  theme_minimal()
