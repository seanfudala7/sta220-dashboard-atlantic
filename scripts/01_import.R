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

# District spending per pupil
budget_per_student <- read_excel('spending_per_student.xlsx')

# Salaries for each school - NEED OPRA REQUEST


