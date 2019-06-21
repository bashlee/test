#' Creates a minimal project template for selected model type
#'
#' @param type model type
#' @examples
#'   create_template("binary")
#' @export
create_template <- function(type = c("binary", "gsd", "fp", "pwe")) {
  
  conn <- system.file("templates", "template.Rmd",package = "gemtcPlus")
  suppressWarnings( lines <- readLines(conn) )
  
  lines[2] <- paste0("title: '", toupper(type), " model - ** update title **'")
  lines[3] <- paste0("author: '", Sys.getenv("USERNAME"), "'")
  lines[31] <- paste0("model_plan <- ", switch(type, 
                                              "binary" = "plan_binary()", 
                                              "gsd"    = "plan_gsd()", 
                                              "fp"     = "plan_fp()",
                                              "pwe"    = "plan_pwe()"))
  file_name <- paste0(type, "_model.Rmd")
  writeLines(lines, file_name)
  
  cat("Template created- ", paste0(getwd(), "/", file_name))
}

