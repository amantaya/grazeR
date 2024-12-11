#' Generate sha256 hash for a file
#'
#' @param x
#'
#' @return
#'
#' @examples
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
#' @param x
#'
#' @return
#'
#' @examples
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

#' Title
#'
#' @param x
#'
#' @return
#'
#' @examples
#'
#' @export
#'
get_prelim_col_spec <- function() {
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

#' Title
#'
#' @param x
#'
#' @return
#'
#' @examples
#'
#' @export
#'
get_prelim_data_schema <- function() {
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
