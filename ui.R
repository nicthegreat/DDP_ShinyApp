#
# This is the user-interface definition of our Shiny BMI web application.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Developing Data Products - Body Mass Index (BMI) Calculator for Singaporeans"),
    
    sidebarPanel(
      numericInput('weight', 'Enter your weight in kilograms', 70) ,
      numericInput('height', 'Enter your height in centimeters', 180, min = 100, max = 250, step = 5),
      submitButton('Calculate BMI')
    ), 
    mainPanel(
      p('The Body Mass Index (BMI) is a measure of body fat based on height and weight that applies to both men and women between the ages of 18 and 65 years.'),
      p('BMI can be used to indicate if you are overweight, obese, underweight or normal. A healthy BMI score as defined by World Health Organization (WHO) is between 20 and 25.'),
      p('However, in Singapore, the BMI figures were revised in 2005 motivated by studies showing that many Asian populations have higher proportion of body fat relative to Caucasians of the same BMI.'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-22.9] : Normal weight'),
          tags$li('BMI [23-27.4]   : Overweight'),
          tags$li('BMI >=27.5       : Severely Overweight')
        )
      ),
      
      h4('Calculating BMI (Singapore) based on values entered by you:'), 
      p('weight in kilograms:'), verbatimTextOutput("inputweightvalue"),
      p('height in centimeters:'), verbatimTextOutput("inputheightvalue"),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
      
    )
    
  )   
)