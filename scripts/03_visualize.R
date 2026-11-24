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

fig_02 <- ggplot(atlantic_town_master) +
  geom_sf(aes(fill = ba_step1), colour = "white") + 
  scale_fill_gradient(low = "white", high = "green", limits = c(50000,NA)) +
  labs(title = "Starting salary for instructional staff by high school",
     subtitle = "Each shape is a school district in Atlantic County, NJ",
     caption = "Source: Teachers' Education Association agreements across districts, 2023-2024"
  ) +
  theme_void()
print(fig_02)
ggsave("output/fig02_atlmap.png", fig_02, width = 6.75, height = 4.85)