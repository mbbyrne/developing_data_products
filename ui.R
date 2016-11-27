library(shiny)
shinyUI(fluidPage(
  
    titlePanel("Plotting of MPG in relation to other variables in the mtcars data set"),
    sidebarLayout(
    sidebarPanel(
      
      
      
      radioButtons("radio1", "Select Variable:", 
        c(  
            "Number of Cylinders"="cyl", 
            "Weight"="wt",
            "Displacement"="disp",
            "Number of Gears"="gear",
            "Gross horsepower"="hp"))
        
    ),
    
    mainPanel(
      tabsetPanel(
      tabPanel("Plot",plotOutput("plot1")),
      tabPanel("Documentation",h3 ("Documentation"),
               "Interactive plot of MPG vs. other variables from the mtcars data set. ",
               "Select a variable using the radio buttons to the left of the plot. ",
               "The plot will change to display MPG in relation to the new variable. ",
               "The plot is a scatter plot of each car available in the data set and a linear model. ",
               "The x axis label will change to show which variable is currently plotted against MPG. ")
              
      
      
      )

    )
  )
))