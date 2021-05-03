library(shiny)

ui <- fluidPage(
  
  h1("Text"),
  
  tags$h1("Another text"),
  
  HTML("<h1>Yet another text</h1>"),
  
  p(style = "font-family:Impact",
    "Hola mundo!"),
  
  a("Google!",
    href = "http://www.google.com")
  
)

server <- function(input, output){}

shinyApp(ui = ui, server = server)