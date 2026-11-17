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
  
  titlePanel("your title"),
  p("For: who is making the decision"),
  p("The decision: the one decision this dashboard helps with"),
  
  selectInput(inputId = "pick", label = "Pick one:", choices = c("choice 1", "choice 2")),
  
  h3("Figure 1. title"),
  plotOutput(outputId = "fig_1"),
  p("a sentence or two saying what the figure shows."),
  
  h3("Figure 2. title"),
  plotOutput(outputId = "fig_2"),
  p("a sentence or two saying what the figure shows."),
  
  h3("What this dashboard cannot tell you"),
  p("the limits of your data.")
  
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
           caption = "Source: NJ Department of Education, 2024"
      )
    
  })
  
  output$fig_2 <- renderPlot({
    
    ggplot()     # replace with your code for Figure 2
    
  })
  
}


# Run the App ------------------------------------------------------------------------------------

shinyApp(ui = ui, server = server)