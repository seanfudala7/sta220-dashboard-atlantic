# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

#################################################################
########### Part 2: Merge to make Master Dataset ################
#################################################################

# Prepare for merge
atlantic_towns <- atlantic_towns |>
  rename(town = "NAME")

nj_districts <- nj_districts |>
  rename(district = "NAME")

# Prepare for merge

# Created town to district lookup table by merging the high school to district table using nj_towns and nj_districts

# Merge budget-per-student spending and school district information

atlantic_master <- town_district_lookup |>
  left_join(atlantic_towns, by = "town") |>
  left_join(nj_districts, by = "district") |>
  select("town", "high_school", "high_school_district", "district", "geometry.y") |>
  rename(geometry = "geometry.y")
