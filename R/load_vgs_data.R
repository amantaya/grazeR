#' Title
#'
#' @param file
#' @param method
#'
#' @return
#' @export
#'
#' @examples
#'
#'
# TODO I can go one of two ways, I can ask users to supply an exact input like "Freq" and then use an if else statement to select the right sheet
# TODO or I can use a regex to pattern match and select the right sheet
# TODO or I can specify the sheet instead of the method, but users could get the spelling slightly wrong
load_vgs_data <- function(file, method) {
    openxlsx::read.xlsx(file, sheet = method)
}
