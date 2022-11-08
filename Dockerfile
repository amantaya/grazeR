FROM rocker/rstudio:4.2.1

LABEL org.opencontainers.image.authors="aantaya@arizona.edu"

RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_version('devtools', version = '2.4.5', repos = 'https://cran.r-project.org/')"
