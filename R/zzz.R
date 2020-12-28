.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "spoiler-assets",
    system.file("spoileralert", package = "spoiler")
  )
}
