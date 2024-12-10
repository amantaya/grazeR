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