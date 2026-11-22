# app.R
# template borrowed from class GitHub

library(shiny)
library(tidyverse)
library(readxl)


# The Data ---------------------------------------------------------------------------------------

# Save your cleaned data in app/data/, then delete the # below.
# Yes, you will have cleaned data in two places in your repo.

budget_per_student <- read_csv('data/budget_per_student.csv')

# Benchmark avg. per student in Atlantic County
benchmark_bps <- mean(budget_per_student$per_student_total)


# The UI (what the reader sees) ------------------------------------------------------------------

ui <- fluidPage(
  
  titlePanel("Time for school!"),
  p("For newly certified high school teachers in the Atlantic County region"),
  p("What is the ideal school to be placed in?"),
  
  h3("Figure 1. Budget per student by school district"),
  plotOutput(outputId = "fig_1"),
  p("Bar chart displaying budget per student for every school district in Atlantic County. From the NJ Department of Education, 2024. Benchmark of $33407.24 is the average budget per student for all New Jersey school districts."),
  
selectInput(inputId = "salarystep", label = "Pick one:", choices = c("ba_step1", "ba15_step1", "ma_step1", "ma15_step1")),
  
  h3("Figure 2. Starting salary by school district"),
  plotOutput(outputId = "fig_2"),
  p("Map of Atlantic County town boundaries. Shaded by salaries of corresponding high school school district. Buena Regional and Mainland Regional School Districts do not have published salaries for 2023-2024 school year. Greater Egg Harbor Regional High School District uses 2024-2025 data."),
  
  h3("What this dashboard cannot tell you"),
  p("This dashboard only uses four cases for salary: bachelor's degree after 1 and 15 years, and master's degree after 1 and 15 years. It does not have the full salary increase between years 1 and 15, and also does not include information on doctorate degrees. It does not include other factors that may affect salary, such as additional certifications or union negotiations.")
  
)


# The Server (how the figures are made) ----------------------------------------------------------

server <- function(input, output) {
  
  output$fig_1 <- renderPlot({
    
    ggplot(budget_per_student, aes(x = per_student_total, y = fct_reorder(district, per_student_total))) + 
      geom_col() + 
      geom_vline(xintercept = benchmark_bps, linetype = "dashed") +
      labs(title = "Budget per student by Atlantic County school district",
           subtitle = "Each school district in Atlantic County is represented by a bar",
           x = "calculated total expenses per student ($)",
           y = "district",
           caption = "Source: NJ Department of Education, Taxpayers' Guide to Education Spending 2023-2024"
      )
    
  })
  
  output$fig_2 <- renderPlot({
    
    ggplot(atlantic_town_master) +
      geom_sf(aes(fill = .data[[input$salarystep]]), colour = "white") + 
      scale_fill_gradient(low = "white", high = "blue", limits = c(50000,NA)) +
      labs(title = "Starting salary for instructional staff by high school",
           subtitle = "Each shape is a school district in Atlantic County, NJ",
           caption = "Source: Teachers' Education Association agreements across districts, 2023-2024"
      ) +
      theme_void()
    
  })
  
}


# Run the App ------------------------------------------------------------------------------------

shinyApp(ui = ui, server = server)