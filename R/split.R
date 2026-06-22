#' Split dataframe into Train and Test dataframes, returning a list with both dataframes.
#'
#' @param df Dataframe
#' @param label Target variable
#' @param p Proportion for Train dataframe
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library("zeallot")
#' c(training_set,test_set) %<-% aitools::split(dataset, dataset$label, 0.8)
#' }
split = function(df,label,p) {
  split = caTools::sample.split(label,SplitRatio=p)
  training_set = subset(df, split == TRUE)
  test_set = subset(df, split == FALSE)
  return(list(training_set=training_set, test_set=test_set))
}


