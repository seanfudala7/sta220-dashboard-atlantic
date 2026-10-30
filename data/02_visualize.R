# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

###########################################################################
######################### Part 2: Visualization ###########################
###########################################################################

ggplot(budget_per_student_clean, aes(x = district, y = per_student_total)) + 
  geom_col() + 
  labs(title = "Budget per student by Atlantic County school district",
       subtitle = "Bruh",
       x = "district",
       y = "calculated total expenses per student ($)",
       caption = "Source: <Source>"
  ) + 
  geom_hline(yintercept = 30, linetype = "dashed")