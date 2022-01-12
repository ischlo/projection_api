#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(sf)
library(tmap)

available_proj <- sf_proj_info()
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Projection"),
    fluidRow(column(3,
                    fileInput("file1", "Choose CSV File", accept = ".csv"))
             ,column(3,
                     selectInput("orig_crs"
                                 ,"File CRS"
                                 ,choices = available_proj$description
                                 ,selected = NULL
                                 ,multiple = FALSE)
                     ,selectInput("dest_crs"
                                  ,"Destination CRS"
                                  ,choices = available_proj$description
                                  ,selected = NULL
                                  ,multiple = FALSE)
                     )
             ,column(3
                     ,conditionalPanel(condition = "output.fileUploaded"
                                       ,uiOutput("lon")
                                       ,uiOutput("lat")
                                       )
                     )
             
                     )
             )
    )
