
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aitools <img src="man/figures/logo.png" align="right" height="138" alt="aitools package" />

<!-- badges: start -->

<!-- badges: end -->

This R Package contains a collection of functions to access AI models

take a look at my youtube playlist with R Tutorials:

------------------------------------------------------------------------

<https://www.youtube.com/playlist?list=PLRbCt61PaxX2d0_QXh6Qi6_jAQd66fmcI>

------------------------------------------------------------------------

## Installation

You can install the development version of aitools from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("EduardoJacob/aitools")
```

### Defined Functions

**gemini(prompt)** This function submits a text prompt to Google’s
Gemini 2.5-flash model via the `gemini.R` package. It requires a
`GEMINI_API_KEY` environment variable, tracks the execution time, and
automatically converts the Markdown response into an HTML file
(gemini.html) which is then displayed in the RStudio viewer.

**lmstudio(prompt)** This function interfaces with a local LLM running
via LM Studio at the default local host address. It uses the `ellmer`
package for communication; if the prompt argument is omitted, it
launches an interactive Shiny chat application, otherwise, it processes
the text prompt and renders the result in the RStudio viewer.

**lmstudio_image(prompt, image_path)** This function extends local LM
Studio capabilities by supporting vision-based tasks. It encodes a local
image file (PNG, JPG, or WebP) into base64 format and sends it alongside
a text prompt to the local API endpoint using `httr2`, returning the
model’s textual description or analysis of the image.

**ollama(prompt)** This function interacts with locally hosted Ollama
models by automatically detecting the most recently installed model via
a system call. It provides a dual interface: an interactive Shiny chat
interface if no prompt is provided, or a direct console-to-viewer
pipeline for single text queries, utilizing the `ellmer` package for
model orchestration.

**openrouter(model, prompt)** This function provides a gateway to the
OpenRouter API, allowing access to a wide variety of cloud models
(defaulting to “openrouter/auto”) using the `OPENROUTER_API_KEY`.
Similar to the other interfaces, it supports both an interactive Shiny
application mode and a direct prompt mode that renders HTML output for
immediate preview.
