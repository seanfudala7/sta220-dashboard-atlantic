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
library(sf)
library(tigris)

# Import data -------------------------------------------------------------

# Data source 1: District spending per pupil for all NJ district
budget_per_student <- read_excel('data/spending_per_student.xlsx', 
                                 skip = 2,
                                 col_names = c("county", "district", "district_code","expense_per_stu","outlay_per_stu","grant_per_stu","food_per_stu","bonds_per_stu","sda_per_stu","total_per_stu","daily_enrollment","per_student_total")
)

# Restrict to Atlantic County high schools
budget_per_student_clean <- budget_per_student |>
  select("county", "district", "district_code", "per_student_total") |>
  filter(county == "Atlantic")

# Three checks - expect 22 rows, 4 columns
dim(budget_per_student_clean) 
names(budget_per_student_clean)
summary(budget_per_student_clean)

# Change per_student_total into type numeric
budget_per_student_clean$per_student_total <- as.numeric(budget_per_student_clean$per_student_total)

# Check
summary(budget_per_student_clean$per_student_total)

# Benchmark avg. per student in Atlantic County
benchmark_bps <- mean(budget_per_student_clean$per_student_total)

# Save cleaned data to app
write_csv(budget_per_student_clean, "app/data/budget_per_student.csv")


# Data source 2: U.S. Census Bureau, cartographic boundary files (1:500,000). tigris downloads them.
#             Counties, towns (county subdivisions), and school districts: 2022.
#             https://www.census.gov/geographies/mapping-files/time-series/geo/cartographic-boundary.html
#             Out: data/boundaries/nj_counties.gpkg, nj_towns.gpkg, nj_school_districts.gpkg 

# Census boundaries (borrowed from workbook 3.3, see README.md for source)

# cb = TRUE: the generalized files, made for maps
# year = 2022
nj_counties <- counties(state = "NJ", cb = TRUE, year = 2022)

nj_towns <- county_subdivisions(state = "NJ", cb = TRUE, year = 2022)

nj_districts <- school_districts(state = "NJ", type = "unified", cb = TRUE, year = 2022)

# Expect 21, 564, and 340 rows
dim(nj_counties)
dim(nj_towns)
dim(nj_districts)

# Filter to Atlantic County towns

atlantic_towns <- nj_towns |>
  filter(COUNTYFP == "001") 

# Save each one as a GeoPackage (.gpkg) to keep the shapes
st_write(nj_counties, "data/boundaries/nj_counties.gpkg", delete_dsn = TRUE, quiet = TRUE)

st_write(nj_towns, "data/boundaries/nj_towns.gpkg", delete_dsn = TRUE, quiet = TRUE)

st_write(nj_districts, "data/boundaries/nj_school_districts.gpkg", delete_dsn = TRUE, quiet = TRUE)


# Data source 3: Town to high school and district look-up table - handwritten Excel, see README for sources
town_district_lookup <- read_excel("data/town_district_lookup.xlsx")


