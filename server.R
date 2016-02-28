# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to help people locate public toilet services, 
# using open datasets from data.gov.uk

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  # Show the list of public toilets that correspond to the filters
  output$table <- renderDataTable({
    toilets <- read.csv("ListOfPublicToilets.csv")
    toilets <- filter(toilets, OrganisationLabel %in% input$Town, Category %in% input$Category, 
                      BabyChange %in% input$Baby, FamilyToilet %in% input$Family, 
                      ChangingPlace %in% input$Changing, ChargeAmount %in% input$Charge)
    toilets
  })
})