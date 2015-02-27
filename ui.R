## ui.R
## Version 1.02

library (shiny)
library (rCharts)

# Placeholder variables
default_Country = "Nepal"

## UI definition
shinyUI(
    fluidPage(  
        titlePanel( "Yearwise Trend - Mobile (1980 - 2013)"),
  
        sidebarPanel(
        div(style = "margin-top: 20px; ", HTML("")),
      
        checkboxInput(inputId = "chartType", label = "Show Bubble Chart Trend", value = FALSE),
        
        conditionalPanel(
            condition = "input.chartType == true",
            sliderInput(inputId="sYear", label = "Year", min = 1980, max = 2013, value = 2013, step = 1)            
        ),
        conditionalPanel(    
            condition = "input.chartType == false",
            selectInput(inputId= "CountryMulti" ,  label =  "Select Country", choices = countryList, selected = default_Country, multi = TRUE),
            CountryMulti="Nepal",
            radioButtons(inputId= "Category" ,  label =  "Category", choices = c(Mobile_Subscription, Mobile_100, Individual_Internet))
        ),          

        div(style = "margin-top: 30px; ", HTML("")),
        helpText("1. Choose Bubble Chart to show trend between Mobile Subscripton and Internet trend."),
        helpText("2. For individual Trend of countires, select Countries from drop down list to display mobile trends.\nChoose between mobile subscription(/rate) and internet usage rate."),
        
        div(style = "margin-top: 10px; ", HTML("")),    
        div(style = "margin-top: 20px; ", HTML("Source: <a href='http://data.un.org//'>UN Data</a>")),
        div(style = "margin-top: 20px; ", HTML("GitHub: <a href='https://github.com/sirujam/developingDataProduct'>Source Code</a> created with Shiny framework and rCharts")),
        div(style = "margin-top: 20px; ", HTML("<a href='http://sirujam.github.io/courseProjectPitch/index.html'>Presentation :</a> Created with <a href http://ramnathv.github.io/slidify/> slidify </a>")),
        div(style = "margin-top: 20px; ", HTML("<a hrefhttp://opensource.org/licenses/MIT/>MIT License </a>"))  
    ),
  
    mainPanel( showOutput("plotGraph","highcharts"))
  )
)