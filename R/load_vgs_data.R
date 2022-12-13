#' Title
#'
#' @param file
#' @param method
#'
#' @return
#' @export
#'
#' @examples
load_vgs_data <- function(file, method) {

  # retrieve sheet names from Excel
  sheet_names <- openxlsx::getSheetNames(file)

  # shorten the name of the Excel sheet for the end user
  if (method == "DWR") {
    sheet <- "DWR (by quadrat)"
  } else if (method == "Freq") {
    sheet <- "Frequency (by quadrat)"
  }
  # TODO add logic for the other sheets
  # TODO if the sheet name changes any, this code will break
  # we might consider using a regex to select the sheet names and load data via an index or regex
  openxlsx::read.xlsx(file, sheet = sheet)
}
