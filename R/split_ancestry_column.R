#' Split Ancestry Column into Allotment and Pasture
#'
#' @param df A data frame with exactly 1 column named "Ancestry".
#'
#' @return
#' @export
#'
#' @examples
split_ancestry_column <- function(df) {
  stopifnot(is.data.frame(df))
  df %>%
    dplyr::mutate(Allotment =
                    # regex that matches all characters before the "<" symbol
                    stringr::str_extract(Ancestry, ".*(?=>)"),
                  .after = SiteID) %>%
    dplyr::mutate(Pasture =
                    # regex that matches all characters after the "< " symbol
                    stringr::str_extract(Ancestry, "(?<=>\\s).*"),
                  .after = Allotment)
}
