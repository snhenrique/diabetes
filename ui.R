# title: "Course Project: Shiny Application and Reproducible Pitch"
# author: "Sandro Henrique"
# https://henriquenunes.shinyapps.io/diabetes/

#
# Convert blood sugar level in both common measurements and offers diabetes diagnostic
# from glucose level
#
#

library(shiny)

# Define UI for application 
shinyUI(fluidPage(
  
    #includeCSS("bootstrap.min.css"),
    
    # Application title
    titlePanel(h1("Blood Sugar Level Calculator Conversion", align="center",
                  style="color: #002e6d")), 
    
    tabsetPanel(

    tabPanel(  
    # Input
    fluidRow(
      column(6, numericInput(inputId="level", 
                          h4("Inform A1C (result of HbA1c lab test) or mg/dl 
                             (capillary blood glucose test)",style="color:#0979bb"), 
                          value = 100)),
      column(6, 
             h3("Notes",style="color:#99cdef"),
             helpText("This application converts A1C to mg / dl or vice versa",
                      "and reports a diagnosis of that blood sugar level.",
                      "Click on Help tab for more information."))
        ),
  fluidRow(
    column(4,
           br(),
           br(), 
           actionButton("Submit",label="Submit",icon("refresh"),
                        ))
    ),
        # show results
         span(textOutput(outputId = "convertedlevel"), align = "center", 
              style='color:hsl(0, 100%, 25%);font-size:25px; margin-left: 200px;'),
         uiOutput(outputId = "diagnosis", align = "center")
    ),
    #)
 #)
  tabPanel(
            h4("Help",style="color:#99cdef"),
            HTML("<p><p>The results of the A1C-Derived Average Glucose study (ADAG) have 
            affirmed the existence of a linear relationship between A1C and 
            average blood glucose levels.<p><p> 
            In light of the study results, the American Diabetes Association is 
            promoting a new term in diabetes management, estimated average 
            glucose or eAG. Health care providers can now report A1C results 
            to patients using the same units (mg/dl or mmol/l) that patients see 
            routinely in blood glucose measurements.<p><p>
            When discussing the effectiveness of an overall treatment plan in 
            diabetes management, the use of eAG can help simplify the discussion 
            between a patient and provider, using terminology and measurements 
            that are familiar to the patient. Using eAG may enhance the diabetes 
            education process by focusing on a single set of values for both 
            daily glucose checks and long-term control.<p><p> 
            This application provides a simple process to convert the main units 
            of blood sugar measurements: <b>A1C (glycated hemoglobin or simply 
            the average of the last three months)</b> and <b>mg / dl (obtained 
            by capillary measurement, fasting glucose laboratory tests and 
            others)</b>.<p><p>
            In addition, it provides a warning about the level of glucose 
            reported, <b>NOT</b> being a diagnosis, which can only be carried out 
            by <u>specialized doctors</u>, but about the level of glucose reported. 
            Thus, an informed normal level may be momentary in diabetics, and 
            an abnormal level may also be occasional in non-diabetics, as they 
            depend on the last feeding performed, for example.<p><p>
            For more information, please visit https://www.professional.diabetes.org/" 
))
    
  ),  style='width: 800px; height: 800px'
 ) 
)
