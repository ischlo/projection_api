#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data_file <- reactive({ 
        if(is_null(input$file1)) {return(NULL)}
        else {input$file1$datapath %>% read_delim(delim = ";")}
        })
    
    output$fileUploaded <- reactive({
        return(!is_null(data_file()))
    })
    outputOptions(output, 'fileUploaded', suspendWhenHidden=FALSE)
    output$lon <-  renderUI({
        varSelectInput("lon"
                       ,label = "x coordinate"
                       ,data = data_file()
                       ,multiple = FALSE)

        })
     output$lat <- renderUI({
        varSelectInput("lat"
                    ,"y coordinates"
                    ,data = data_file() %>% dplyr::select(-input$lon)
                    ,multiple = FALSE)
         })
     })
    


