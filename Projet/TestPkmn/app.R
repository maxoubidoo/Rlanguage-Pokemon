#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(gapminder)
library(dplyr)
library(ggplot2)
library(tidyverse)


datapokemon$Generation <- as.factor(datapokemon$Generation)
datapokemon$PokedexNumber   <- as.integer(datapokemon$PokedexNumber)

datapokemon$TotalStats <- as.integer(datapokemon$TotalStats)

datapokemon$HP   <- as.integer(datapokemon$HP)
datapokemon$Speed <- as.integer(datapokemon$Speed)


datapokemon$Attack   <- as.integer(datapokemon$Attack)
datapokemon$Sp.Atk <- as.integer(datapokemon$Sp.Atk)

datapokemon$Defense <- as.integer(datapokemon$Defense)
datapokemon$Sp.Def <- as.integer(datapokemon$Sp.Def)




dataset = datapokemon



# Define UI for application that draws a histogram
ui <- fluidPage(title = "Pokemon Stats",
                
                plotOutput('plot', click = "plot_click"),
                tableOutput("data"),
                
                hr(),
                
                fluidRow(
                    column(
                        3,
                        h4("Pokemon Stats"),
                        checkboxGroupInput("variable", "Types : ",
                                           levels(datapokemon$TypeOne)),
                        br(),
                        checkboxInput('compare', 'Compare')
                    ),
                    column(
                        4,
                        offset = 1,
                        selectInput(
                            'x',
                            'X',
                            c(
                                "TotalStats"  ,
                                "HP"       ,
                                "Attack"    ,
                                "Defense"   ,
                                "Sp.Atk"   ,
                                "Sp.Def"    ,
                                "Speed"
                            )
                        ),
                        selectInput(
                            'y',
                            'Y',
                            c(
                                "None",
                                "TotalStats" ,
                                "HP"       ,
                                "Attack"    ,
                                "Defense"   ,
                                "Sp.Atk"   ,
                                "Sp.Def"    ,
                                "Speed"
                            ),
                            names(dataset)[[2]]
                        ),
                        selectInput('color', 'Color', c(
                            'None' = NULL , c("Legendary", "Generation", "TypeTwo")
                        ))
                    ),
                    
                    
                    #text box
                    #verbatimTextOutput("info")
                    
                    
                    
                ))




# Define server logic required to draw a histogram
server <- function(input, output) {
    output$plot <- renderPlot({
        #datapokemon %>%
        if( length(input$variable) != 0)
        {
        dataset = filter(datapokemon, datapokemon$TypeOne %in% input$variable)
        
        
        if(input$y== "None" )  {
           plot = ggplot(dataset,
                   aes_string(
                       x = input$x
                   )) +
                geom_histogram(bins =10, color = "black", fill = "red", alpha = 0.6) +
               labs(title = paste("Repartition of" ,input$x , "for the selected type(s)" ))+
               theme(text = element_text(size = 20))
            
        }
        
        else{
        plot = ggplot(dataset,
               aes_string(
                   x = input$x,
                   y = input$y ,
                   color = dataset$TypeOne,
                   shape = input$color
               )) +
            geom_point(size = 2.5) +
            labs(title = paste("Comparison of" ,input$x , "and" , input$y ,  "for the selected type(s)" ))+
            theme(text = element_text(size = 20))
        }
        
        if(input$compare)
        {
            plot = plot  +  facet_wrap( ~ TypeOne, ncol = 3)
        }
        
        plot
        }
        
    })
    
    #output$info <- renderPrint({
    #    nearPoints(dataset, input$plot_click, threshold = 10, maxpoints = 1)
    #})
    
    
    
    
    output$data <- renderTable({
        nearPoints(dataset, input$plot_click)
    })
    
    
}



# Run the application
shinyApp(ui = ui, server = server)
