require (shiny)
require (rCharts)

shinyUI(
  fluidPage(  
    titlePanel( "Yearwise Trend - Mobile"),
  
    sidebarPanel(
      div(style = "margin-top: 20px; ", HTML("")),
    
      selectInput(inputId= "CountryMulti" ,  label =  "Select Country", choices = r$Country, selected = TRUE, multi = TRUE),
      radioButtons(inputId= "Category" ,  label =  "Category", choices = c(Mobile_Subscription,Individual_Internet)),
    
      div(style = "margin-top: 30px; ", HTML("")),
    
      ## Instructions and Data Source
      helpText("1. Select Countries from drop down list to display mobile trends."),
      helpText("2. Choose between mobile subscription and internet usage rate."),
      
      div(style = "margin-top: 10px; ", HTML("")),    
      div(style = "margin-top: 20px; ", HTML("Source: <a href='http://data.un.org//'>UN Data</a>")),
      div(style = "margin-top: 20px; ", HTML(""))
    ),
  
    mainPanel( showOutput("plotGraph","highcharts"))
  )
)