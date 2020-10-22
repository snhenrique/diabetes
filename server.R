# title: "Course Project: Shiny Application and Reproducible Pitch"
# author: "Sandro Henrique"
# https://henriquenunes.shinyapps.io/diabetes/
#
# Convert blood sugar level in both common measurements and offers diabetes diagnostic
# from glucose level
#
#

library(shiny)


A1C2Cap<-function(input){
  level <- ((input * 28.7)-48.7)
  if(level < 119) myval <- 1 
  else
  ifelse(level < 141, myval <- 2,myval <- 3)
  units <- c('mg/dl')
  return(list(level = level,myval = myval,units = units))
}

Cap2A1C<-function(input){
  level <- round(((input + 48.7)/28.7),digits=1)
  if(level < 5.8) myval <- 1 
  else
    ifelse(level < 6.5, myval <- 2,myval <- 3)
  units <- c('mmol/l')
  return(list(level = level,myval = myval,units = units))
}

# 
server <- function(input, output) {
    converted_level <- eventReactive(input$Submit,
                         {
                           if(input$level < 21)
                               return(A1C2Cap(input$level))  
                            else 
                               return(Cap2A1C(input$level))  
                               })
  
  output$convertedlevel<-renderText({
     print(converted_level)  
     paste0("Converted blood sugar level: ", converted_level()$level,
            " ",converted_level()$units)
            
 })
 output$diagnosis<-renderUI({
    if(converted_level()$myval=='1')
      img(src='image1.png', width = '300px')
    else
      if(converted_level()$myval=='2') 
        img(src='image2.png', width = '300px')
      else
        img(src='image3.png', width = '300px')
  })
} 
