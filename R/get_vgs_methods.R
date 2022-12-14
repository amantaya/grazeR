#' Title
#'
#' @param file
#'
#' @return
#' @export
#'
#' @examples
get_vgs_methods <- function(file) {
  if (interactive() == TRUE) {
    file <- file.choose()
  }
  sheet_names <- openxlsx::getSheetNames(file)
  return(sheet_names)
}
