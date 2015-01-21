library (shiny)
library (rCharts)

options(RCHART_WIDTH = 600)

## Server function
shinyServer(
  function(input, output) {
    ## reactive Plot Graph
    output$plotGraph <- renderChart2({
    
      dataP <- getDataPlot(input$CountryMulti)      
      if(input$Category == Mobile_Subscription){
         h1 <- hPlot(Subscription ~ Year,  data = dataP,
                     color = 'Country', type = 'line',
                     group = 'Country', title = Mobile_Subscription )
      
      }
      else if(input$Category == Individual_Internet){
        h1 <- hPlot(Internet ~ Year, data = dataP,
                    color = 'Country', type = 'line',
                    group = 'Country', title = Individual_Internet )
      }
       else{
         ## Return empty chart
         h1 <- NULL
      }
    
      return(h1)
    })
  }
)


## Get the data to be plotted
getDataPlot <- function(Country){
  
  if(is.null(Country)){
    return (r[FALSE,])
  }
  
  for (i in Country){
    if(exists("good")) good <- good | r$Country == i
    else good <- r$Country == i      
  }
  
  return (r[good,])
}