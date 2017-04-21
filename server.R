
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
library(DT)
shinyServer(function(input, output) {
  
  
  TheophAm<-Theoph[, c("Dose","Wt","Time","conc")]
  #
  # Model taken from Yjeoph documentation, 
  # changed so it is not subject specific
  # 
  fm1 <- nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl),
             data = TheophAm)
 
   Time<-seq(from=0.00,to=24.00, by=1)
 
    Pred<-reactive({
      Dosage<-input$Dosage
      Weight<-input$Weight
      WeightKg<-Weight/2.2046 # convert weight to kg
      DosageKg<-Dosage/WeightKg # convert to mg/kg
      p<-predict(fm1,newdata = data.frame(Time,Dose =DosageKg))
      p[1:25]
      #data.frame(Time,conc=pts,Wt=WeightKg,Dose=DosageKg)
  })
    WeightKg<-reactive({
      Weight<-input$Weight
      Weight/2.2046 # convert weight to kg
    })
    DosageKg<-reactive({
      Dosage<-input$Dosage
      Dosage/WeightKg()
    })
    WeightLB<-reactive({
      Weight<-input$Weight
      Weight
    })
    output$WtKG <- renderText({ WeightKg() }) 
    output$DoseKG <- renderText({ DosageKg() }) 

      #Table
    output$table<-DT::renderDataTable({
        data.frame(Time,
                   WtLB=input$Weight,
                   WtKg=round(input$Weight/2.2046,digits = 3),
                   Dosemg=input$Dosage,
                   Dosemgkg=round(input$Dosage/input$Weight/2.2046,digits=3),
                   Prediction=round(Pred(),digits = 3))
      })
    

  #Plot

  
  output$distPlot <- renderPlot({
   
    plot(x = Time, y = Pred(),
         xlab = "Time(hr) since drug administration",
         ylab = "Theophylline concentration (mg/L)",
         ylim = c(0,max(Pred())+5),
         main = "Theophylline Prediction on Non Linear Model",
         sub  = paste("Input weight converted to kg",
                      round(WeightKg(),3),
                      ", Dosage converted to Dosage/kg", 
                      round(DosageKg(),3)),
         col = "blue", lwd = 1 ,xaxt="n",pch = 16)
    axis(1,at = seq(from=0,to=24, by=1))})
  


  })


