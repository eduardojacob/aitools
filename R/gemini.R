#' Submit a prompt to gemini
#'
#' @param prompt Text prompt
#' @param model Optional Gemini model name
#' @param image Optional image file
#'
#' @export
#'
#' @examples
#' \dontrun{
#' gemini("Qual a capital de Portugal?")
#' }
gemini = function(prompt,model="2.5-flash",image) {
  message("Calling gemini ",model,": ", prompt )

  # gemini.R::setAPI(Sys.getenv("GEMINI_API_KEY"))
  if ( Sys.getenv("GEMINI_API_KEY") == "") {
    stop("Please set GEMINI_API_KEY in your .Renviron file")
  }

  start_time = Sys.time()

  if ( missing(image) ) {
    answer = gemini.R::gemini(prompt=prompt,model=model)
  } else {
    answer = gemini.R::gemini_image(image=image,prompt=prompt,model=model)
  }

  time_diff = difftime(Sys.time(), start_time, units = "secs")
  message("Elapsed ", round(time_diff, 2), " seconds.")

  return(answer)
}

