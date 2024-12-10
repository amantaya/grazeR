#' @title strict_read_csv
#'
#' @param data Path to a CSV file.
#'
#' @return A tibble with the data from the CSV file
#' that has been read in and parsed according to the
#' preliminary greenfeed data column specification.
#'
#' @examples
#' \dontrun{
#' strict_read_csv(here::here("data", "preliminary-greenfeed-data.csv"))
#' @export
strict_read_csv <-
    function(data) {
        prelim_greenfeed_data_col_spec <-
            readr::read_rds(
                here::here(
                    "specs",
                    "readr",
                    "preliminary-greenfeed-data-column-specification.Rds"
                )
            )
        data |>
            readr::read_csv(
                col_types = prelim_greenfeed_data_col_spec
            )
    }
