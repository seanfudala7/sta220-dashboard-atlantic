# Project:   STA 220 Final Project
# File Name: 03_visualize.R
# Author:    Sean Fudala

###########################################################################
######################### Part 3: Visualization ###########################
###########################################################################

library(tidyverse)

# Visual 1: Bar chart of budget_per_student 

fig_01 <- ggplot(budget_per_student_clean, aes(x = per_student_total, y = fct_reorder(district, per_student_total))) + 
  geom_col() + 
  geom_vline(xintercept = benchmark_bps, linetype = "dashed") +
  labs(title = "Budget per student by Atlantic County school district",
       subtitle = "Each school district in Atlantic County is represented by a bar",
       x = "calculated total expenses per student ($)",
       y = "district",
       caption = "Source: NJ Department of Education, 2024"
  )
print(fig_01)
ggsave("output/fig01_bps_bar.png", fig_01, width = 6.75, height = 4.85)
  
# Visual 2: Atlantic County map

library(sf)       # maps: a data table with a shape column
library(tigris)

# Load the Data ----------------------------------------------------------------------------------

# Every town in New Jersey, already downloaded and saved in data/boundaries/
# see 01_import for creation of nj_towns.gpkg 
nj_towns <- read_sf("data/boundaries/nj_towns.gpkg")

atlantic_towns <- nj_towns |>
  filter(COUNTYFP == "001")

### UNCOMMENT AFTER CREATING TOWN TO DISTRICT LOOKUP TABLE
#fig_02 <- ggplot(atlantic_towns) +
#  geom_sf(aes(fill = STATEFP), colour = "white") + 
#  labs(title = "Title",
#       subtitle = "Subtitle",
#       caption = "Source: "
#  ) +
#  theme_void()
#print(fig_02)
#ggsave("output/fig02_atlmap.png", fig_02, width = 6.75, height = 4.85)


# Example reference
#ggplot(nj12_vote) +
#  geom_sf(aes(fill = margin_pct), colour = "white") +
#  scale_fill_gradient2(low = "#b2182b", mid = "white", high = "#2166ac", midpoint = 0) +
#  labs(
#    title = "Watson Coleman won Trenton by 70 points; Mayfield won Helmetta by 25",
#    fill = "Margin\n(points)",
#    caption = "Positive: Watson Coleman ahead.\nSource: NJ Division of Elections, 2024 U.S. House, 12th District"
#  ) +
#  theme_void()