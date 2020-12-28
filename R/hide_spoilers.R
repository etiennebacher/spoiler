hide_spoilers <- function(max = 10, partial = 4) {
  htmltools::tags$script(
    paste0(
      "spoilerAlert('spoiler, .spoiler', {max: ", max, ", partial: ", partial, "});"
    )
  )
}
