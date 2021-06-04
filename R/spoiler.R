#' Use Spoiler-alert
#'
#' Load Spoiler-alert dependencies, mark some elements as spoilers, and define
#' the blurring intensity for these elements.
#'
#' @export
#' @rdname spoiler
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(spoiler)
#'
#'   # works better in browser
#'
#'   ui <- fluidPage(
#'     # Load dependencies
#'     use_spoiler(),
#'     column(
#'       3,
#'       p("this text can be seen"),
#'       spoiler(p("this one can't be seen")) # This text will be blurred
#'     ),
#'     hide_spoilers()
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui, server)
#' }

use_spoiler <- function() {

  shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(
        src = "spoiler-assets/spoiler.min.js"
      )
    )
  )
}

#' @param ui_element Element to blur
#'
#' @rdname spoiler

spoiler <- function(ui_element) {

  htmltools::tagAppendAttributes(
    ui_element,
    class = "spoiler"
  )

}

#' @param max Blurring intensity of the element by default
#'
#' @param partial Blurring intensity when hovering the element
#'
#' @rdname spoiler

hide_spoilers <- function(max = 10, partial = 4) {
  htmltools::tags$script(
    paste0(
      "spoilerAlert('spoiler, .spoiler', {max: ", max, ", partial: ", partial, "});"
    )
  )
}

