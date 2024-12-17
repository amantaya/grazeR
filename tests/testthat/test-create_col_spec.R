test_that("preliminary greenfeed data column specification is correct", {
    # get the preliminary greenfeed data column specification
    preliminary_greenfeed_data_column_specification <- get_prelim_col_spec()
    # check if the preliminary greenfeed data column specification is correct
    expect_equal(
        preliminary_greenfeed_data_column_specification,
        readr::read_rds(
            testthat::test_path(
                    "inst",
                    "extdata",
                    "preliminary-greenfeed-data-column-specification.Rds"
                )
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
            testthat::test_path(
                "inst",
                "extdata",
                "preliminary-greenfeed-data-schema.csv"
            ),
            col_types = get_prelim_col_spec()
        )
    )
})