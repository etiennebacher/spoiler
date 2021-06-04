
# spoiler


The goal of `{spoiler}` is to blur any HTML elements (text, plots, etc.) in R Shiny apps, so that spoilers are avoided.

## Installation

You can install the released version of spoiler from [CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("devtools")
devtools::install_github("etiennebacher/spoiler")
```

## Demo

``` r
library(shiny)
library(spoiler)

# works better in browser

ui <- fluidPage(
  use_spoiler(),
  column(
    4,
    spoiler(plotOutput("test"))
  ),
  hide_spoilers(max = 10, partial = 4)
)

server <- function(input, output, session) {
  
  output$test <- renderPlot(plot(mtcars$mpg))
  
}

shinyApp(ui, server)
```

![](demo.gif)
