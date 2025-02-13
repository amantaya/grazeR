#' @title Validate EID Length
#'
#' @param eid A character string representing
#' the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID is of the correct length.
#'
#' @examples
#' valid_eid <- "123456789012345"
#' validate_eid_length(valid_eid) # returns TRUE
#' invalid_eid <- "12345678901234"
#' validate_eid_length(invalid_eid) # returns FALSE
#'
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
#' valid_eid <- "982012345678901"
#' validate_eid_prefix(valid_eid) # returns TRUE
#' invalid_eid <- "123456789012345"
#' validate_eid_prefix(invalid_eid) # returns FALSE
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

#' @title Get Length of EID
#'
#' @param eid A character string representing
#' the electronic identification number (EID) of an animal.
#'
#' @return An integer representing the length of the EID.
#'
#' @examples
#' get_eid_length("123456789012345") # returns 15
#'
#' @export
#' @importFrom stringr str_length
get_eid_length <- function(eid) {
    return(stringr::str_length(eid))
    }

#' @title Get the Manufacturer or Type of an EID
#'
#' @param eid A character string representing
#' the electronic identification number (EID) of an animal.
#'
#' @return A character string representing the manufacturer or type of the EID.
#'
#' @examples
#' get_eid_type("982012345678901") # returns "Allflex"
#' get_eid_type("985012345678901") # returns "Destron Fearing"
#' get_eid_type("840012345678901") # returns "USDA Animal Identification Number"
#' get_eid_type("123456789012345") # returns NA_character_
#' get_eid_type(NA) # returns NA_character_
#' @importFrom magrittr %||%
#' @export
get_eid_type <- function(eid) {
    if (is.na(eid)) {
        return(NA_character_)
    }
    first_three_digits <- substr(eid, 1, 3)
    # NOTE: this is not a complete list of manufacturers
    if (first_three_digits == "840") {
        return("USDA Animal Identification Number")
    } else if (first_three_digits == "982") {
        return("Allflex")
    } else if (first_three_digits == "985") {
        return("Destron Fearing")
    } else if (first_three_digits == "942") {
        return("Zee Tags")
    } else if (first_three_digits == "949") {
        return("Y-Tex")
    } else {
        return(NA_character_)
    }
}
