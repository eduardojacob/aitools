#' Submit a prompt to local LM Studio LLM
#'
#' @param prompt Text prompt
#' @param model Optional LM Studio model name
#' @param image Optional image file
#'
#' @export
#'
#' @examples
#' \dontrun{
#' lmstudio("Qual a capital de Portugal?")
#' }
lmstudio = function(prompt,model,image) {
  if ( missing(model) ) {
    models = ellmer::models_lmstudio()
    model = models[1,]
  }

  CHAT = ellmer::chat_lmstudio(model=model)

  if ( missing(prompt) ) {
    shinychat::chat_app(CHAT)
  } else {
    message("Calling LM Studio ",model,": ", prompt )
    start_time = Sys.time()

    if ( missing(image) ) {
      answer = CHAT$chat(prompt,echo=F)
    } else {
      answer = CHAT$chat(prompt,echo=F,ellmer::content_image_file(image) )
    }

    time_diff = difftime(Sys.time(), start_time, units = "secs")
    message("Elapsed ", round(time_diff, 2), " seconds.")

    return(answer)
  }

}


