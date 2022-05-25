#Modify the 02-hist-app.R code by adding an additional sliderInput for the standard deviation for your normal random variables (hint: ?rnorm).

library(shiny)
?rnorm
ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  sliderInput("sd", "Standard Deviation:", value = 1.0, min = 0.0, max=10.0, step=0.1),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num,sd=input$sd))
  })
}

shinyApp(ui = ui, server = server)


