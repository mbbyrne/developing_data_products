library(shiny)
shinyServer(function(input, output) {
    
    
    var_mpg<-mtcars$mpg
    
    var <- renderPrint({
        variable <- input$radio1
        paste("mtcars$",variable,sep="")
    })
    
    output$plot1 <- renderPlot({
      
        if (input$radio1 == 'cyl'){
        var<-mtcars$hp  
        xlabel<-"Number of Cylinders"
        }
        
        else if (input$radio1 == 'hp'){
            var<-mtcars$cyl
            xlabel<-"Horsepower"
        }
        
        else if (input$radio1 == 'wt'){
            var<-mtcars$wt   
            xlabel<-"Weight (1000lbs)"
        }
        
        else if (input$radio1 == 'disp'){
            var<-mtcars$disp  
            xlabel<-"Displacement"
        }
        
        else if (input$radio1 == 'gear'){
            var<-mtcars$gear  
            xlabel<-"Number of Gears"
        }
        
        mtcars$var<-var
        
        model1 <- lm(mpg~var, data = mtcars)
        
        plot(var, var_mpg, 
             xlab = xlabel, 
             ylab = "MPG", 
             bty = "n", 
             pch = 16, 
             col = "blue",
             col.lab="purple",
             col.axis="red"
        )
        
            abline(model1, col = "green", lwd = 2)
            

    })
    

})