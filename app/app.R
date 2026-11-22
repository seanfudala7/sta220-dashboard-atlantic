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
  
  titlePanel("Go back to school!"),
  p("For newly certified high school teachers in the Atlantic County region"),
  p("The decision: what is the ideal school to be placed in?"),
  
  selectInput(inputId = "pick", label = "Pick one:", choices = c("choice 1", "choice 2")),
  
  h3("Figure 1. Budget per student by school district"),
  plotOutput(outputId = "fig_1"),
  p("Bar chart displaying budget per student for every school district in Atlantic County. From the NJ Department of Education, 2024."),
  
  h3("Figure 2. Starting salary by school district"),
  plotOutput(outputId = "fig_2"),
  p("Map of Atlantic County town boundaries. Labeled with salaries of corresponding high school school district."),
  
  h3("What this dashboard cannot tell you"),
  p("Limits.")
  
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
    
    ### UNCOMMENT AFTER CREATING TOWN TO DISTRICT LOOKUP TABLE
    #fig_02 <- ggplot(atlantic_towns) +
    #  geom_sf(aes(fill = ALAND), colour = "white") + 
    #  scale_fill_gradient(low = "white", high = "blue") +
    #  labs(title = "Starting salary for instructional staff by high school",
    #     subtitle = "Subtitle",
    #     caption = "Source: My source"
    # ) +
    #  theme_void()
    #print(fig_02)
    #ggsave("output/fig02_atlmap.png", fig_02, width = 6.75, height = 4.85)
    
  })
  
}


# Run the App ------------------------------------------------------------------------------------

shinyApp(ui = ui, server = server)