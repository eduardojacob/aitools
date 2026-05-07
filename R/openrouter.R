#' Submit a prompt to openrouter
#'
#' @param model Model name
#' @param prompt Text prompt
#'
#' @export
#'
#' @examples
#' \dontrun{
#' openrouter("Qual a capital de Portugal?")
#' }
openrouter = function(model="openrouter/auto",prompt) {

  # uses OPENROUTER_API_KEY R environment variable
  CHAT = ellmer::chat_openrouter(model=model)

  if ( missing(prompt) ) {
    shinychat::chat_app(CHAT)
  } else {
    message("Calling openrouter, model: ", model, " prompt: ", prompt )
    start_time = Sys.time()

    answer = CHAT$chat(prompt,echo=F)

    html = markdown::mark_html(text = answer)
    temp_file = tempfile(fileext = ".html")
    writeLines(html, temp_file)
    rstudioapi::viewer(temp_file)

    time_diff = difftime(Sys.time(), start_time, units = "secs")
    message("Elapsed ", round(time_diff, 2), " seconds.")


    return(answer)
  }

}












