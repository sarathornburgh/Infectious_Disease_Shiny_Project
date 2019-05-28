#Load Neccesary packages for script to run 
library("deSolve")
library("shiny")

#Shiny Components
#UserInput UI 
ui <- fluidPage(
  numericInput(inputId = "infectedpop",
               label = "Number of People Infected at Begining",
               min = 1,
               max = 1000,
               value = 1e-6
            ),
  
  numericInput(inputId = "userbeta",
               label = "Infection Rate",
               min = 0,
               max = 100,
               value = 1.4247
            ),
  
  numericInput(inputId = "usergamma",
               label = "Recovery Rate",
               min = 0,
               max = 1,
               value = 0.14286
            ),
  
  numericInput(inputId = "timeframe",
               label ="Number of Days",
               min = 1,
               max = 1000,
               value = 70
            ),
  mainPanel(
    plotOutput("matPlot")
  
  )
)


#Server 
server <- function(input, output) {
  dataInput <- reactive({
    #Infectious Disease Mathematical Model aka SIR
    sir <- function(time, state, parameters) {
      
      with(as.list(c(state, parameters)), {
        
        dS <- -beta * S * I
        dI <-  beta * S * I - gamma * I
        dR <-                 gamma * I
        
        return(list(c(dS, dI, dR)))
      })
    }
    init <- c(
      S = 1-input$infectedpop, 
      I = input$infectedpop, 
      R = 0.0)
    #Parameters beta and gamma
    parameters <- c(
      beta = input$userbeta,
      gamma = input$usergamma) 
    #Parameters beta and gamma
    times <- seq(0, input$timeframe, by = 1)
    #Solve using ode (General Solver for Ordinary Differential Equations)
    out <- as.data.frame(ode(y = init, times = times, func = sir, parms = parameters))
    #Delete time variable
    out$time <- NULL
    list(out = out, times = times) 
  })
  output$matPlot <- renderPlot({
    matplot(dataInput()$times,dataInput()$out, 
            type = "l", 
            xlab = "Time in Days", 
            ylab = "Susceptibles and Recovereds", main = "SIR Model", 
            lwd = 1, lty = 1, bty = "l", col = 2:4)
  legend(40, 0.7, c("Susceptible", "Infected Population", "Recovered"), pch = 1, col = 2:4) })
  

  
}


shinyApp(ui = ui, server = server)