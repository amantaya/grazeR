#' @title Validate EID Length
#'
#' @param eid A character string representing the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID is of the correct length.
#'
#' @examples
#' @export
validate_eid_length <- function(eid) {
    if (is.na(eid)) {
        return(FALSE)
    }
    return(nchar(eid) == 15)
}

#' @title Validate EID Prefix
#'
#' @param eid A character string representing
#' the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID has a valid prefix.
#'
#' @examples
#' @export
validate_eid_prefix <- function(eid) {
    if (is.na(eid)) {
        return(FALSE)
    }
    first_three_digits <- substr(eid, 1, 3)
    # NOTE: this is not a complete list of acceptable prefixes
    accepatble_prefixes <- c(
        "840", # USA Country Code - USDA AIN Complaint
        "982", # Allflex
        "985", # Destron Fearing
        "942", # Zee Tags
        "949" # Y-Tex
    )
    return(first_three_digits %in% accepatble_prefixes)
}
