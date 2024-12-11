test_that("file sha256 hash is correct", {
    # create a temporary file
    temp_file <- tempfile(fileext = ".txt")
    writeLines("Hello, world!", temp_file)
    # generate the sha256 hash
    sha256_hash <- generate_sha256_hash(temp_file)
    sha256_hash <- as.character(sha256_hash)
    # remove the temporary file
    unlink(temp_file)
    # check if the sha256 hash is correct
    expect_equal(
        sha256_hash,
        "66b01763ad80316783341083c02317e7fdda4391e58cbf02f26f2a92257c5b92"
    )
})

test_that("file md5 hash is correct", {
    # create a temporary file
    temp_file <- tempfile(fileext = ".txt")
    writeLines("Hello, world!", temp_file)
    # generate the sha256 hash
    md5_hash <- generate_md5_hash(temp_file)
    md5_hash <- as.character(md5_hash)
    # remove the temporary file
    unlink(temp_file)
    # check if the sha256 hash is correct
    expect_equal(
        md5_hash,
        "78016cea74c298162366b9f86bfc3b16"
    )
})

test_that("preliminary greenfeed data column specification is correct", {
    # get the preliminary greenfeed data column specification
    preliminary_greenfeed_data_column_specification <- get_prelim_col_spec()
    # check if the preliminary greenfeed data column specification is correct
    expect_equal(
        preliminary_greenfeed_data_column_specification,
        readr::read_rds(
            here::here(
                "data",
                "specs",
                "readr",
                "preliminary-greenfeed-data-column-specification.Rds"
            )
        )
    )
})

test_that("preliminary greenfeed data schema is correct", {
    # get the preliminary greenfeed data schema
    preliminary_greenfeed_data_schema <- get_prelim_data_schema()
    # check if the preliminary greenfeed data schema is correct
    expect_equal(
        preliminary_greenfeed_data_schema,
        readr::read_csv(
            here::here(
                "data",
                "specs",
                "schema",
                "preliminary-greenfeed-data-schema.csv"
            ),
            col_types = get_prelim_col_spec()
        )
    )
})

test_that("strict_read_csv correctly parses data", {
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
    # get the preliminary greenfeed data schema
    parsed_data <- strict_read_csv(
        here::here(
            "data",
            "examples",
            "preliminary-greenfeed-data.csv"
        ) # TODO - create a test data file
    )
    # Define the expected data frame
    expected_data <- tibble::tibble(
        column1 = c("value1", "value2"),
        column2 = c(1.0, 2.0),
        column3 = as.Date(c("2021-01-01", "2021-01-02"))
    )
    # check if the preliminary greenfeed data schema is correct
    expect_equal(
        parsed_data,
        expected_data
        )
})
