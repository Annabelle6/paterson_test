#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
x <- read_rds("wine.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("New Zealand Wine"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        # Input: Numeric entry for number of obs to view ----
        numericInput(inputId = "nobs",
                     label = "Number of observations to view:",
                     value = 10)
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        
        tableOutput("view")
        
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$view <- renderTable({
    head(x, n = input$nobs)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

