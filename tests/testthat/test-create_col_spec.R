test_that("create_prelim_col_spec returns correct column specifications", {
  expected_col_spec <- readr::cols(
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

  actual_col_spec <- create_prelim_col_spec()

  expect_equal(actual_col_spec, expected_col_spec)
})

# TODO - create a test for get_prelim_col_spec
# test_that("get_prelim_col_spec returns correct column specifications", {

