#Modify the 02-hist-app.R code to create a table of output values using renderDataTable()
library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  shiny::dataTableOutput("mytable"),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
  output$mytable = shiny::renderDataTable({
    mtcars
  })
}

shinyApp(ui = ui, server = server)

