#' Create a `readr` column specification for the preliminary greenfeed data
#'
#' @param none A placeholder for the function to work with the
#' create_col_spec function in the roxygen2 documentation.
#'
#' @return
#'
#' @examples
#' \dontrun{
#' create_col_spec()
#' }
#' @export
create_col_spec <- function() {
    column_spec <- readr::cols(
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
    readr::write_rds(
        column_spec,
        here::here(
            "data",
            "specs",
            "readr",
            "preliminary-greenfeed-data-column-specification.rds"
        )
    )
}
