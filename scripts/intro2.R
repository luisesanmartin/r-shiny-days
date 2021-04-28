library(shiny)

ui <- fluidPage(
  
  actionButton(inputId = "clicks",
               label = "Click here"),
  
  sliderInput(inputId = "num",
              label = "Choose your number",
              value = 25,
              min = 1,
              max = 100),
  
  textInput(inputId = "title",
            label = "Title of Histogram of Random Normal Values"),
  
  plotOutput("hist"),
  
  verbatimTextOutput("summary")
)

server <- function(input, output) {
  
  vector <- reactive({
    
    rnorm(input$num)
    
  })
  
  output$hist <- renderPlot({
    
    hist(vector(), # this calls the vector obj
         main = isolate({input$title}))
    # isolate means that the title won't update every time
    # the value of the text box "title" is updated.
    # It will only update when other reactive inputs are updated
    
  })
  
  output$summary <- renderPrint({
    
    summary(vector())
    
  })
  
  observeEvent(input$clicks,
               {print(as.numeric(input$clicks))})
  
}

shinyApp(ui = ui, server = server)