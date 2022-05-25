#Modify the 02-hist-app.R code to create a histogram from the ggplot2 library instead of using hist() from base graphics
library(shiny)
library(ggplot2)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  plotOutput("hist")
)

server <- function(input, output) {

  output$hist <- renderPlot({
    ggplot(data.frame(rnorm(input$num)),aes(rnorm(input$num),color=rnorm(input$num))) + geom_histogram()
  })
}

shinyApp(ui = ui, server = server)

