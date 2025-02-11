#' Create a `readr` column specification for the preliminary greenfeed data
#'
#' @param none A placeholder for the function to work with the
#' create_col_spec function in the roxygen2 documentation.
#'
#' @return A `readr` column specification for the preliminary greenfeed data.
#'
#' @examples
#' \dontrun{
#' create_col_spec()
#' }
#' @export
create_prelim_col_spec <- function(none) {
  prelim_column_spec <- readr::cols(
    FeederID = readr::col_double(),
    AnimalName = readr::col_character(),
    RFID = readr::col_character(),
    StartTime = readr::col_datetime(format = "%Y-%m-%d %H:%M:%S"),
    EndTime = readr::col_datetime(format = "%Y-%m-%d %H:%M:%S"),
    GoodDataDuration = readr::col_time(),
    CO2GramsPerDay = readr::col_double(),
    CH4GramsPerDay = readr::col_double(),
    O2GramsPerDay = readr::col_double(),
    H2GramsPerDay = readr::col_double(),
    H2SGramsPerDay = readr::col_double(),
    AirflowLitersPerSec = readr::col_double(),
    AirflowCf = readr::col_double(),
    WindSpeedMetersPerSec = readr::col_double(),
    WindDirDeg = readr::col_double(),
    WindCf = readr::col_double(),
    WasInterrupted = readr::col_logical(),
    InterruptingTags = readr::col_character(),
    TempPipeDegreesCelsius = readr::col_double(),
    IsPreliminary = readr::col_logical(),
    RunTime = readr::col_datetime(format = "%Y-%m-%d %H:%M:%S")
  )
  # TODO - save the column specification to a file
}

#' Get the preliminary greenfeed data column specification from an RDS file
#'
#' @param none A placeholder for the function to work with the
#' get_prelim_data_schema function in the roxygen2 documentation.
#'
#' @return A readr column specification for the
#' preliminary greenfeed data where each column is parsed
#' according to the data type in the column specification.
#'
#' @examples
#' \dontrun{
#' get_prelim_col_spec()
#' }
#'
#' @export
#'
# FIXME - the RDS file does not exist yet
get_prelim_col_spec <- function(none) {
  preliminary_greenfeed_data_column_specification <-
    readr::read_rds(
      here::here(
        "inst",
        "extdata",
        "preliminary-greenfeed-data-column-specification.Rds"
      )
    )
  return(preliminary_greenfeed_data_column_specification)
}

#' Get the preliminary greenfeed data schema from a CSV file
#'
#' @param none A placeholder for the function to work with the
#' get_prelim_data_schema function in the roxygen2 documentation.
#'
#' @return A tibble with the standardized column names
#' for preliminary greenfeed data that has been read
#' in and parsed according to the
#' preliminary greenfeed data column specification.
#'
#' @examples
#' \dontrun{
#' get_prelim_data_schema()
#' }
#'
#' @export
#'
get_prelim_data_schema <- function(none) {
  empty_df <- readr::read_csv(
    system.file(
      "extdata",
      "preliminary-greenfeed-data-schema.csv",
      package = "grazer"
    ),
    col_types = create_prelim_col_spec()
  )
  return(empty_df)
}
