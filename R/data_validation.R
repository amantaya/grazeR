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
#' @param eid A character string representing the electronic identification number (EID) of an animal.
#'
#' @return A logical value indicating whether the EID has the correct prefix.
#'
#' @examples
#' @export
validate_eid_prefix <- function(eid) {
    if (is.na(eid)) {
        return(FALSE)
    }
    first_four_digits <- substr(eid, 1, 4)
    # TODO: Add support for other EID prefixes (e.g., 840, 982, 985, 942, 949)
    # "840" maps USA country code and is also USDA official animal identification number (AIN)
    # 982 for Allflex, 985 for Destron Fearing, 942 for Z Tags, 949 for Y-TEX) https://www.leedstone.com/university/cattle-id-tag-terminology-article/?srsltid=AfmBOoqfWaeuEn1k7fgHejyMNJAIT5o8LPgx9pYNbiiYIfT_3AXlENdZ
    return(first_four_digits == "9820")
}
