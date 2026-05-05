#' Submit a prompt to gemini
#'
#' @param prompt Text prompt
#'
#' @export
#'
#' @examples
#' \dontrun{
#' gemini("Qual a capital de Portugal?")
#' }
gemini = function(prompt) {
  message("Calling gemini: ", prompt )

  gemini.R::setAPI(Sys.getenv("GEMINI_API_KEY"))

  start_time = Sys.time()

  answer = gemini.R::gemini(prompt=prompt,model="2.5-flash")

  html = markdown::mark_html(text = answer)

  temp_file = tempfile(fileext = ".html")
  writeLines(html, temp_file)

  rstudioapi::viewer(temp_file)

  time_diff = difftime(Sys.time(), start_time, units = "secs")
  message("Elapsed ", round(time_diff, 2), " seconds.")

  # save html on current directory
  writeLines(html,"gemini.html")

  return(answer)

}

