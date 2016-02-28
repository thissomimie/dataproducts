# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose the public toilet services located in Bournemouth, Manchester, Northumberland, Peterborough and Sheffield . 

library(markdown)

shinyUI(navbarPage("Locate The Public Toilet App",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Provide information about public toilets in 4 cities"),
                                selectInput("Town", label = h3("City/Town"), 
                                            choices = list("Bournemouth", "Manchester",
                                                           "Northumberland County Council", 
                                                          "Peterborough City Council","Sheffield City Council"), 
                                            selected = NULL),
                                checkboxGroupInput("Category", 
                                                   label = h3("Category"), 
                                                   choices = list("Unisex","Male","Female"),selected = c("Unisex","Male","Female")),
                                checkboxGroupInput("Baby", label = h3("Baby Changing"),
                                             choices = list("Yes", "No"),selected = c("Yes","No")),
                                checkboxGroupInput("Family", label = h3("Family Toilet"),
                                             choices = list("Yes", "No"),selected =  c("Yes","No")),
                                checkboxGroupInput("Changing", label = h3("Changing Place"),
                                             choices = list("Yes", "No"),selected =  c("Yes","No")),
                                sliderInput("Charge", label = h3("Charge Amount"),
                                            min = 0, max = 1, value = c(0,1))
                                  ),
                         
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
)
)   