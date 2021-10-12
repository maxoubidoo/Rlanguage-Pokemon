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
library(ggradar)


datapokemon <- read_csv("C:/Users/maxou/OneDrive/Bureau/Travail/4eme année/DSIA_R/Projet/Pokemon.csv")
names(datapokemon) <- c("PokedexNumber"  ,"Name" ,"TypeOne" ,"TypeTwo"  , "TotalStats"  ,  "HP" ,  "Attack" ,  "Defense"  ,  "Sp.Atk"   , 
                        "Sp.Def",    "Speed"  ,    "Generation", "Legendary" )



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Pokemon Test One"),
    
    
    #Check Box
    checkboxGroupInput("variable", "Types : ",
                       levels(datapokemon$TypeOne))
                         ,
    
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("plot")
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$plot <- renderPlot({
        
        
        datapokemon %>%
            filter(TypeOne == input$variable ) %>%
            ggplot( aes(x=Attack, y=Sp.Atk , fill=TypeOne)) +
            geom_point(aes(color=TypeOne)) +
            facet_wrap(~TypeOne, ncol=2) +
            geom_smooth()
        
        
    })
    
}



# Run the application 
shinyApp(ui = ui, server = server)

