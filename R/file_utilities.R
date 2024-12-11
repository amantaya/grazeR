#' Generate sha256 hash for a file
#'
#' @param file_path A path to a file.
#'
#' @return A sha256 hash for the file.
#'
#' @examples
#' temp_file <- tempfile(fileext = ".txt")
#' writeLines("Hello, world!", temp_file)
#' sha256_hash <- generate_sha256_hash(temp_file)
#'
#' @export
generate_sha256_hash <- function(file_path) {
    con <- file(file_path, "rb")
    file_hash <- openssl::sha256(con)
    close(con)
    file_hash <- as.character(file_hash)
    return(file_hash)
}

#' Generate md5 hash for a file
#'
#' @param file_path A path to a file.
#'
#' @return A md5 hash for the file.
#'
#' @examples
#' temp_file <- tempfile(fileext = ".txt")
#' writeLines("Hello, world!", temp_file)
#' md5_hash <- generate_md5_hash(temp_file)
#'
#' @export
# function to open the file and create a md5 hash
generate_md5_hash <- function(file_path) {
    con <- file(file_path, "rb")
    file_hash <- openssl::md5(con)
    file_hash <- as.character(file_hash)
    close(con)
    return(file_hash)
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
get_prelim_col_spec <- function(none) {
preliminary_greenfeed_data_column_specification <-
  readr::read_rds(
    here::here(
      "specs",
      "readr",
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
        here::here(
            "specs",
            "schema",
            "preliminary-greenfeed-data-schema.csv"
        ),
    col_types = get_prelim_col_spec()
    )
    return(empty_df)
}
