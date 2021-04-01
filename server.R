
library(shiny)
shinyServer(function(input, output) {
    library("readxl")
    library(dplyr)
    
    mydt <- read_excel("dlks.xlsx", sheet=1, col_names=TRUE)
    mytable <- reactive({
    mydt <- mydt %>% subset(Major==input$faculty) #goi du lieu trong input select pai dat trong reactive
    mytable <- data.frame(table(mydt$VL))
    })
    output$tbl <- renderTable(mytable()) #goi du lieu tu ket qua cua reactive pai dat them ()
    output$pl <- renderPlot({
        plot(x=mytable()[,1], y=mytable()[,2], pch=21, col="blue", lwd=3, ylab="Job status", xlab="The number of alumni", ylim=c(1,14))
        lines(x=mytable()[,1], y=mytable()[,2], lwd=2, col="green")
    })
    })


