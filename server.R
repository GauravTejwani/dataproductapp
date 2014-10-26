library(shiny)
library(UsingR)

data(galton)
galtondata <- galton
model <- lm(child~parent,data=galtondata)
constant <- summary(model)$coef[1] ; beta <- summary(model)$coef[2]

sonheight <- function(height) constant + beta*height

shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({if(input$radio==0) "Male" else "Female"})
    output$inputValue2 <- renderPrint({input$height})
    output$prediction <- renderPrint({sonheight(input$height*(1+0.08*as.numeric(input$radio)))})
  }
)
