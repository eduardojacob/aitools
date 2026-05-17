#' Submit a prompt to local ollama LLM
#'
#' @param prompt Text prompt
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ollama("Qual a capital de Portugal?")
#' }
ollama = function(prompt) {

  ollama_list = system("ollama list",intern=T)
  N = length(ollama_list)
  message("Calling Ollama model: ",ollama_list[N])
  model = sub(":.*", "",ollama_list[N])
  # check ollama
  # system2("ollama", c("run", "gpt-oss", "Hello"), stdout = TRUE)
  CHAT = ellmer::chat_ollama(model = model)

  if ( missing(prompt) ) {
    shinychat::chat_app(CHAT)
  } else {
    start_time = Sys.time()

    answer = CHAT$chat(prompt,echo=F)

    time_diff = difftime(Sys.time(), start_time, units = "secs")
    message("Elapsed ", round(time_diff, 2), " seconds.")
  }

}

