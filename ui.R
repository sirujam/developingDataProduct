## ui.R
library (shiny)
library (rCharts)

## UI definition
shinyUI(
  fluidPage(  
    titlePanel( "Yearwise Trend - Mobile (1980 - 2014)"),
  
    sidebarPanel(
      div(style = "margin-top: 20px; ", HTML("")),
    
      selectInput(inputId= "CountryMulti" ,  label =  "Select Country", choices = countryList, selected = TRUE, multi = TRUE),
      radioButtons(inputId= "Category" ,  label =  "Category", choices = c(Mobile_Subscription,Individual_Internet)),
    
      div(style = "margin-top: 30px; ", HTML("")),
    
      ## Instructions and Data Source
      helpText("1. Select Countries from drop down list to display mobile trends."),
      helpText("2. Choose between mobile subscription and internet usage rate."),
      
      div(style = "margin-top: 10px; ", HTML("")),    
      div(style = "margin-top: 20px; ", HTML("Source: <a href='http://data.un.org//'>UN Data</a>")),
      div(style = "margin-top: 20px; ", HTML("GitHub: <a href='https://github.com/sirujam/developingDataProduct'>Source Code</a> created with Shiny framework and rCharts")),
      div(style = "margin-top: 20px; ", HTML("<a href='http://sirujam.github.io/courseProjectPitch/index.html'>Presentation :</a> Created with <a href http://ramnathv.github.io/slidify/> slidify </a>"))  
    ),
  
    mainPanel( showOutput("plotGraph","highcharts"))
  )
)

