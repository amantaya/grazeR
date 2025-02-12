#' @title Validate EID Length
#'
#' @param eid A character string representing the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID is of the correct length.
#'
#' @examples
#'
#' @export
validate_eid_length <- function(eid) {
    if (nchar(eid) != 15) {
        return(FALSE)
    } else if (nchar(eid) == 15) {
        return(TRUE)
    }
}

#' @title Validate EID Prefix
#'
#' @param eid A character string representing the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID has the correct prefix.
#'
#' @examples
#'
#' @export
validate_eid_prefix <- function(eid) {
    first_four_digits <- substr(eid, 1, 4)
    if (first_four_digits != "9820") {
        return(FALSE)
    }
    return(TRUE)
}