#' Submit a prompt to local LM Studio LLM
#'
#' @param prompt Text prompt
#'
#' @export
#'
#' @examples
#' \dontrun{
#' lmstudio("Qual a capital de Portugal?")
#' }
lmstudio = function(prompt) {

  CHAT = ellmer::chat_openai(model="",base_url="http://localhost:1234/v1")

  if ( missing(prompt) ) {
    shinychat::chat_app(CHAT)
  } else {
    message("Calling LM Studio: ", prompt )
    start_time = Sys.time()

    answer = CHAT$chat(prompt,echo=F)

    html = markdown::mark_html(text = answer)

    temp_file = tempfile(fileext = ".html")
    writeLines(html, temp_file)

    rstudioapi::viewer(temp_file)

    time_diff = difftime(Sys.time(), start_time, units = "secs")
    message("Elapsed ", round(time_diff, 2), " seconds.")

    # save html on current directory
    # writeLines(html,"lmstudio.html")

    return(answer)
  }

}


