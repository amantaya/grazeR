source("renv/activate.R")

library("devtools")
# load the functions from the R package in the 'R' directory
devtools::load_all()

library("usethis")
library("logger")
library("RPushbullet")

if (interactive() == TRUE) {
  # run the Pushbullet setup if you are missing a rpushbullet config file
  if (RPushbullet::pbValidateConf(conf = "./.rpushbullet.json") == FALSE) {
    RPushbullet::pbSetup()
  }

  options(error = function() {
    RPushbullet::pbPost("note", "Error", geterrmessage())
    if (!interactive()) stop(geterrmessage())
  }
  )
}

# set the default log level to INFO
# this will log all messages with a level of INFO or higher
# change the log level to a higher level to supress log messages with a lower level
# the log levels in order of priority are: OFF FATAL ERROR WARN SUCCESS INFO DEBUG TRACE
# e.g. logger::log_threshold("ERROR") supresses all log messages with a level of WARN or lower
logger::log_threshold(Sys.getenv("LOG_LEVEL"))
