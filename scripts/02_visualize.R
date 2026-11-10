# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

###########################################################################
######################### Part 2: Visualization ###########################
###########################################################################

ggplot(budget_per_student_clean, aes(x = per_student_total, y = district)) + 
  geom_col() + 
  labs(title = "Budget per student by Atlantic County school district",
       subtitle = "Each school district in Atlantic County is represented by a bar",
       x = "district",
       y = "calculated total expenses per student ($)",
       caption = "Source: NJ Department of Education, 2024"
  ) + 
  geom_vline(xintercept = 30, linetype = "dashed")
