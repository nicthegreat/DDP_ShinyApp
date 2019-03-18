#
# This is the server logic of our Shiny BMI web application. 
#

library(shiny)

# Define server logic required to create BMI calculator
BMI<-function(weight,height) {(weight)/((height/100)^2)}

diagnostic_f<-function(weight,height){
  BMI_value<-(weight)/((height/100)^2)
  ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<23,"Normal Weight",ifelse(BMI_value<27.5,"Overweight","Severely Overweight")))
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  } 
)
