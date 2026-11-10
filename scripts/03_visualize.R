# Project:   STA 220 Final Project
# File Name: 01_import.R
# Author:    Sean Fudala

###########################################################################
######################### Part 2: Visualization ###########################
###########################################################################

# Bar chart of budget_per_student 

ggplot(budget_per_student_clean, aes(x = per_student_total, y = fct_reorder(district, per_student_total))) + 
  geom_col() + 
  geom_vline(xintercept = benchmark_bps, linetype = "dashed") +
  labs(title = "Budget per student by Atlantic County school district",
       subtitle = "Each school district in Atlantic County is represented by a bar",
       x = "district",
       y = "calculated total expenses per student ($)",
       caption = "Source: NJ Department of Education, 2024"
  )
  
