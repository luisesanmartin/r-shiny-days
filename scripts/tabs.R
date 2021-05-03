library(shiny)

ui <- fluidPage(
  
  title = "Hello",
  
  tabsetPanel(
    tabPanel(
      title = "Page 1",
      h1("Content")
    ),
    tabPanel(
      title = "Page 2",
      h1("More content!")
    )
  )
  
)

server <- function(input, output) {}

shinyApp(server = server, ui = ui)