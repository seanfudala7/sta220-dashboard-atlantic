# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

#################################################################
################## Part 1: Packages and Data ####################
#################################################################

# Load packages -----------------------------------------------------------

library(tidyverse)
library(readxl)
library(shiny)

# Import data -------------------------------------------------------------

# District spending per pupil for all NJ districts
budget_per_student <- read_excel('spending_per_student.xlsx', 
                                 skip = 2,
                                 col_names = c("county", "district", "district_code","expense_per_stu","outlay_per_stu","grant_per_stu","food_per_stu","bonds_per_stu","sda_per_stu","total_per_stu","daily_enrollment","per_student_total")
)

# Restrict to Atlantic County high schools
budget_per_student_clean <- budget_per_student |>
  select("county", "district", "district_code", "per_student_total") |>
  filter(county == "Atlantic")



# Salaries for each school - NEED OPRA REQUEST


