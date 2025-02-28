% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_validation.R
\name{validate_eid_prefix}
\alias{validate_eid_prefix}
\title{Validate EID Prefix}
\usage{
validate_eid_prefix(eid)
}
\arguments{
\item{eid}{A character string representing
the electronic identification number (EID) of an animal.}
}
\value{
A logical value indicating whether the EID has a valid prefix.
}
\description{
Validate EID Prefix
}
\examples{
valid_eid <- "982012345678901"
validate_eid_prefix(valid_eid) # returns TRUE
invalid_eid <- "123456789012345"
validate_eid_prefix(invalid_eid) # returns FALSE
}
