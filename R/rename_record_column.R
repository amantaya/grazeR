#' Rename "Record" Column
#'
#' @param df A data frame with exactly 1 column named "Record".
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' df <- data.frame(Record = 1)
#' rename_record_column(df)
#'
rename_record_column <- function(df) {
  stopifnot(is.data.frame(df))
dplyr::rename(df, Sample = "Record")
}
