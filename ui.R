
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(DT)
shinyUI(fluidPage(

  # Application title
  titlePanel("Pharmacokinetics of Theophylline"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
   
    sidebarPanel(

      h4("Step right up and Predict the absorption of Theophylline by selecting your weight and dose."),
      h4(),
      h5("Slide the dot to your weight"),
      sliderInput("Weight", "Weight in LB?", 50, 350, value = 175),
      h4(),
      h5("Slide the dot to your dosage"),
    sliderInput("Dosage", "Dosage of Theophylline in mg?", 165, 510, value = 250)
    ),
      

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Non Linaer Plot", plotOutput("distPlot")), 
        tabPanel("Table", DT::dataTableOutput("table"))
       
        
    )
  )
)))
