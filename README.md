# sta220-dashboard-atlantic

Sean Fudala's final project for STA 220.

# Scripts

1. `01_import.R` imports our data sources and instantiates them into tables.
2. `02_merge.R` merges the tables into a single data frame.
3. `03_visualize.R` creates visualizations of the data.

# Data

Source 1: New Jersey Department of Education, Taxpayers’ Guide to Education Spending, 
          "Total Spending Per Pupil", 2023-2024
             https://www.nj.gov/education/guide/2025tges.shtml
             Out: data/spending_per_student.xlsx

This project examines data of high schools in Atlantic County, New Jersey. The
schools used are the following:

Source 2: U.S. Census Bureau, cartographic boundary files (1:500,000). tigris downloads them.
             Counties, towns (county subdivisions), and school districts: 2022.
             https://www.census.gov/geographies/mapping-files/time-series/geo/cartographic-boundary.html
             Out: data/boundaries/nj_counties.gpkg, nj_towns.gpkg, nj_school_districts.gpkg
             
Source 3: Handwritten data of Atlantic County towns, high schools, and school districts
             Compiled from: 
             Out: data/town_district_lookup.xlsx
             



# Visualizations

Graphics packages used to create the Atlantic County map visualization in part borrowed from STA 220's script 3.1/data/boundaries