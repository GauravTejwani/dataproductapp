library(shiny)
library(UsingR)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Predict your child's height"),
    
    sidebarPanel(
      radioButtons("radio", label = h3("Parent Gender"),
                   choices = list("Male" = 0, "Female" = 1),selected = 1),
      sliderInput('height', 'Parent Height (in inches)',value = 64, min = 64, max = 73, step = 0.05,),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered your sex as'),
      verbatimTextOutput("inputValue1"),
      h4('You entered your height as'),
      verbatimTextOutput("inputValue2"),
      h4('Your child height (in inches) is'),
      verbatimTextOutput("prediction")
    )
  )
)
