#' Title
#'
#' @param seed An optional seed for reproducibility.
#'
#' @return A numeric value corresponding to the RFID. The first 9 digits are all zeros. The last 15 digits are randomly generated.
#'
#' @examples
#' generate_rfid(seed = 123)
#'
#' @export
generate_rfid <- function(seed = NULL) {
    # if seed is not NULL, set the supplied seed for reproducibility
    if (!is.null(seed)) {
    set.seed(seed)
    } else {
    set.seed(123)
    }
    # Generate the last 15 digits as a random number
    last_15_digits <- sample(0:999999999999999, 1)
    # Concatenate the first 9 digits (all zeros) with the last 15 digits
    # to create a 24-digit RFID
    # this converts the number to a string
    rfid <- paste0("000000000", last_15_digits)
    # convert the string to a number
    as.numeric(rfid)
    return(rfid)
}

#' Generate synthetic GreenFeed data for testing or simulation.
#'
#' @param path A path to where the synthetic data should be saved.
#' @param n The number of rows of synthetic data to generate.
#' @param seed An optional seed for reproducibility.
#'
#' @return A CSV file containing synthetic GreenFeed data.
#' The data includes the following columns:
#' - FeederID: A numeric value corresponding to the feeder ID.
#' - AnimalName: A character value corresponding to the animal name.
#' - RFID: A character value corresponding to the RFID.
#' - StartTime: A datetime value corresponding to the start time.
#' - EndTime: A datetime value corresponding to the end time.
#' - GoodDataDuration: A time value corresponding to the good data duration.
#' - CO2GramsPerDay: A numeric value corresponding to the CO2 grams per day.
#' - CH4GramsPerDay: A numeric value corresponding to the CH4 grams per day.
#' - O2GramsPerDay: A numeric value corresponding to the O2 grams per day.
#' - H2GramsPerDay: A numeric value corresponding to the H2 grams per day.
#' - H2SGramsPerDay: A numeric value corresponding to the H2S grams per day.
#' - AirflowLitersPerSec: A numeric value corresponding to the airflow in liters per second.
#' - AirflowCf: A numeric value corresponding to the airflow in cubic feet.
#' - WindSpeedMetersPerSec: A numeric value corresponding to the wind speed in meters per second.
#' - WindDirDeg: A numeric value corresponding to the wind direction in degrees.
#' - WindCf: A numeric value corresponding to the wind in cubic feet.
#' - WasInterrupted: A logical value indicating whether the data was interrupted.
#' - InterruptingTags: A character value corresponding to the interrupting tags.
#' - TempPipeDegreesCelsius: A numeric value corresponding to the temperature of the pipe in degrees Celsius.
#' - IsPreliminary: A logical value indicating whether the data is preliminary.
#' - RunTime: A datetime value corresponding to the run time.
#'
#' @examples
#' \dontrun{
#' generate_synthetic_data("data/synthetic_prelim_greenfeed_data.csv", 1000)
#'  }
#' @export
#'
generate_synthetic_data <- function(path, n, seed) {

# if seed is not NULL, set the supplied seed for reproducibility
if (!is.null(seed)) {
  set.seed(seed)
} else {
  set.seed(123)
}

# Generate sample data
sample_data <- data.frame(
    FeederID = sample(100:800, n, replace = TRUE),
    AnimalName = as.character(replicate(n, generate_rfid())),
    RFID = AnimalName,
    StartTime = sample(
        seq(
            lubridate::ymd_hms('2023-01-01 00:00:00'),
            lubridate::ymd_hms('2023-12-31 23:59:59'),
            by = "hour"),
            n,
            replace = TRUE),
    EndTime = sample(
        seq(
            lubridate::ymd_hms('2023-01-01 01:00:00'),
            lubridate::ymd_hms('2024-01-01 00:00:00'),
            by = "hour"),
            n,
            replace = TRUE),
    GoodDataDuration = sprintf(
        "%02d:%02d:%02d",
        sample(0:23, n, replace = TRUE),
        sample(0:59, n, replace = TRUE),
        sample(0:59, n, replace = TRUE)
        ),
    CO2GramsPerDay = round(runif(n, 0, 1000), 2), # NOTE: may need to adjust the range
    CH4GramsPerDay = round(runif(n, 0, 1000), 2), # NOTE: may need to adjust the range
    O2GramsPerDay = round(runif(n, 0, 1000), 2), # NOTE: may need to adjust the range
    H2GramsPerDay = round(runif(n, 0, 1000), 2), # NOTE: may need to adjust the range
    H2SGramsPerDay = round(runif(n, 0, 1000), 2), # NOTE: may need to adjust the range
    AirflowLitersPerSec = round(runif(n, 10, 30), 2), # NOTE: may need to adjust the range
    AirflowCf = round(runif(n, 10, 30), 2), # NOTE: may need to adjust the range
    WindSpeedMetersPerSec = round(runif(n, 0, 10), 2), # NOTE: may need to adjust the range
    WindDirDeg = round(runif(n, 0, 360), 2), # NOTE: may need to adjust the range
    WindCf = round(runif(n, 0, 100), 2), # NOTE: may need to adjust the range
    WasInterrupted = sample(c(TRUE, FALSE), n, replace = TRUE),
    InterruptingTags = as.character(replicate(n, generate_rfid())), # NOTE: most of the observations will be NA. We need to inject the a realistic number of interruptions.
    TempPipeDegreesCelsius = round(runif(n, 0, 100), 2), # NOTE: may need to adjust the range
    IsPreliminary = rep(1, n), # NOTE: 1 is a logical for TRUE
    RunTime = sample(
        seq(
            lubridate::ymd_hms('2023-01-01 00:00:00'),
            lubridate::ymd_hms('2023-12-31 23:59:59'),
            by = "hour"),
            n,
            replace = TRUE)
    )

# Optionally, write the data to a CSV file

write.csv(sample_data, path, row.names = FALSE)
}
