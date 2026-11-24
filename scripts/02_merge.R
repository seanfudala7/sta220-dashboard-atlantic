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

salary_by_district <- salary_by_district |>
  rename(high_school_district = "high_school") 

# Add percent change column
salary_by_district <- salary_by_district |>
  mutate(pct_change_ba_ma = ((ma_step1 - ba_step1) / ba_step1) * 100) 

# Prepare for merge

# Created town to district lookup table by merging the high school to district table using nj_towns and nj_districts

# Merge budget-per-student spending and school district information

atlantic_town_master <- atlantic_towns |>
  left_join(town_district_lookup, by = "town") |>
  left_join(salary_by_district, by = "high_school_district")