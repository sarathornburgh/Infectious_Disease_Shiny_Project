
library("deSolve")
library("shiny")
infectious <- function(t, y, p){
  {S<- y[1] 
  I<- y[2] 
  R<- y[3] }
  
  with(as.list(p), {
    dS.dt<--B*I*S 
    dI.dt<-B*I*S-g*I 
    dR.dt<-g*I
    return(list(c(dS.dt, dI.dt, dR.dt)))}) 
  
}

#User Interfa
ui <- fluidPage(
  numericInput(inputId = "totalpop",
               label = "Total Population",
               min = 0,
               max = 10000000000000000000000000000000000000000000000,
               value = 10000),
  numericInput(inputId = "infectedpop",
               label = "Number of People Infected at Begining",
               min = 0,
               max = 100000,
               value = 10),
  numericInput(inputId = "beta",
               label = "Infection Rate",
               min = 0,
               max = 10000000,
               value = 0.01),
  numericInput(inputId = "gamma",
               label = "Recovery Rate",
               min = 0,
               max = 10000000,
               value = 4),
  numericInput(inputId = "timeframe",
               label ="Number of Months",
               min = 1,
               max = 1000000000000000,
               value = 3),
  mainPanel(plotOutput("matPlot"))
    )

#Server
server <- function(input, output){
  datainput <- reactive({
    I <- R <- input$infectedpop
    S <- ((input$totalpop) - I - R)
    parms<- c(B =input$beta, g =input$gamma)
    months <- seq(0, input$timeframe, by = 0.01)
    out <- data.frame(ode(c(S, I, R), months, infectious, parms))
    list(months = months, out = out)
    })
  output$matPlot <- renderPlot({
    matplot(datainput()$months,datainput()$out[, -1], type = "l", lty = 1:3, col = 1 )
    legend("right", c("R", "I", "S"), lty = 3:1, col = 3:1, bty = "n")
           })
}
shinyApp(ui = ui, server = server)