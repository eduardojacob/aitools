#' Submit a prompt to local LM Studio LLM
#'
#' @param prompt Text prompt
#' @param image_path Path to image
#'
#' @export
#'
#' @examples
#' \dontrun{
#' lmstudio_image("Describe this image","image_name.png")
#' }
lmstudio_image = function(prompt,image_path) {

  # prompt = "Describe this image"
  # image_path = "Screenshot 2026-03-18 164852.png"
  # Encode image
  img_base64 = base64enc::base64encode(image_path)

  # Detect mime type (basic)
  ext = tools::file_ext(image_path)
  mime = switch(tolower(ext),
                 jpg = "image/jpeg",
                 jpeg = "image/jpeg",
                 png = "image/png",
                 webp = "image/webp",
                 stop("Unsupported image format"))

  # Build request
  req = httr2::request("http://localhost:1234/v1/chat/completions") |>
    httr2::req_headers(`Content-Type` = "application/json") |>
    httr2::req_body_json(list(
      #model = model,
      messages = list(
        list(
          role = "user",
          content = list(
            list(type = "text", text = prompt),
            list(
              type = "image_url",
              image_url = list(
                url = paste0("data:", mime, ";base64,", img_base64)
              )
            )
          )
        )
      )
    ))

  # Send request
  resp = httr2::req_perform(req)
  result = httr2::resp_body_json(resp)

  # Return answer
  return(result$choices[[1]]$message$content)

}










