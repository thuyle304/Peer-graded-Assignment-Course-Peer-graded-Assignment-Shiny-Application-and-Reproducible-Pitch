library(shiny)

shinyUI(fluidPage(
    titlePanel("Alumni Survey Data"),
    sidebarLayout(
        sidebarPanel(
            
            selectInput("faculty", "Chose the major:", c("IBM", "CSE"))
        ),
        mainPanel(
            h3("Job status of alumni"),
            tableOutput("tbl"),
            plotOutput("pl")
        )
    )))
