FROM rocker/rstudio:4.2.1

LABEL org.opencontainers.image.authors="aantaya@arizona.edu"

RUN R -e "install.packages('devtools')"

COPY --chown=rstudio .Rprofile home/rstudio/
