## server.R
## Version 1.02
## dependency :: Shiny apps link :: http://shiny.rstudio.com/
##            :: rCharts    link :: http://ramnathv.github.io/slidify/

library (shiny)
library (rCharts)

options(RCHART_WIDTH = 600)

r <- getUNData()

## Server function
shinyServer(
    function(input, output) {

        ## reactive Plot Graph
        output$plotGraph <- renderChart2({
            if(input$chartType == TRUE){
                h1 <- hPlot (MobilePer100 ~ Internet, data = r[r$Year == input$sYear,],
                             type = "bubble", size = 'Subscription', group = 'Country',
                             color = 'Country', animation = TRUE)
                h1$legend(enabled = FALSE)  
                h1$xAxis(min = -5, max = 100, title = list(text = Individual_Internet))
                h1$yAxis(min = -50, max = 350, title = list(text = Mobile_100))
                h1$tooltip(valueDecimals = 2)
            }
            else{
                dataP <- getDataPlot(input$CountryMulti)
      #
      isBubble = FALSE
      #
                if(input$Category == Mobile_Subscription){
                    h1 <- hPlot(Subscription ~ Year,  data = dataP,
                        color = 'Country', type = 'line',
                        group = 'Country', title = Mobile_Subscription )
                    h1$yAxis(title = list(text = Mobile_Subscription))
                    h1$tooltip(valueDecimals = 0)
                }
                else if(input$Category == Mobile_100){
                    h1 <- hPlot(MobilePer100 ~ Year, data = dataP,
                                color = 'Country', type = 'line',
                                group = 'Country', title = Mobile_100 )                    
                    h1$yAxis(title = list(text = Mobile_100))                    
                    h1$tooltip(valueDecimals = 2)                    
                }
                else if(input$Category == Individual_Internet){
                    h1 <- hPlot(Internet ~ Year, data = dataP,
                        color = 'Country', type = 'line',
                        group = 'Country', title = Individual_Internet)
                    h1$yAxis(title = list(text = Individual_Internet))                        
                    h1$tooltip(valueDecimals = 2)
                }                
                else{
                    ## Return empty chart
                    h1 <- NULL
                }
            } 
            return(h1)
        })
    }
)


## Get the data to be plotted
## param @Country :: Country/ies for which data to be subsetted for Plotting
## result :: Dataframe for the given countries
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

