### Exercise 3 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 

# It should take as an input the x_var, y_var, color, and size
# Save the result of `renderPlot` to output$scatter

    # Store x and y values to plot

    # Store the title of the graph in a variable

    
    # Create ggplot scatter
server <- function(input, output){
  output$scatter <- renderPlot({
    x_axis <- mpg[[input$x_variable]]
    y_axis <- mpg[[input$y_variable]]
    title <- paste0("MPG Dataset: ", input$x_variable, " VS ", input$y_variable)
    p <- ggplot() +
      geom_point(mapping = aes(x = x_axis, y = y_axis), 
                 size = input$size, 
                 color = input$color) +
      labs(x = input$x_variable, y = input$y_variable, title = title)
    p
  })
}

shinyApp(ui, server)
