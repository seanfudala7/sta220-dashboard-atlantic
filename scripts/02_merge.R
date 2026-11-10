# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

#################################################################
########### Part 2: Merge to make Master Dataset ################
#################################################################


# Crossover table - matching high schools to their respective school districts

hs_district <- tribble(
  ~high_school,    ~district,
  "Absegami", "Galloway",
  "Atlantic City", "Atlantic City",
  "Atlantic County Institute of Technology", "Atlantic Co Vocational",
  "Buena", "Buena Regional",
  "Cedar Creek", "Greater Egg Harbor Reg",
  "Egg Harbor Twp", "Greater Egg Harbor Reg",
  "Hammonton",     "Hammonton Town",
  "Mainland", "Mainland Regional",
  "Oakcrest", "Greater Egg Harbor Reg",
  "Pleasantville", "Pleasantville City"
)