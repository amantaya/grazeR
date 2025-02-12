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
