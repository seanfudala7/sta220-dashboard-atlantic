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

########## Data source 1: District spending per pupil for all NJ district
budget_per_student <- read_excel('spending_per_student.xlsx', 
                                 skip = 2,
                                 col_names = c("county", "district", "district_code","expense_per_stu","outlay_per_stu","grant_per_stu","food_per_stu","bonds_per_stu","sda_per_stu","total_per_stu","daily_enrollment","per_student_total")
)


# Restrict to Atlantic County high schools
budget_per_student_clean <- budget_per_student |>
  select("county", "district", "district_code", "per_student_total") |>
  filter(county == "Atlantic")


dim(budget_per_student_clean) # 22 rows, 4 columns
names(budget_per_student_clean)
summary(budget_per_student_clean)

# Change per_student_total into type numeric
budget_per_student_clean$per_student_total <- as.numeric(budget_per_student_clean$per_student_total)

# Check
summary(budget_per_student_clean$per_student_total)

# Benchmark avg. per student in Atlantic County

benchmark_bps <- mean(budget_per_student_clean$per_student_total)


######## Data source 2: Salaries for each school - NEED OPRA REQUEST


