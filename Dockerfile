FROM rocker/r-ver:4.4.1

RUN apt-get update && apt-get install -y \
    gpg \
    git \
    python3-pip

RUN pip install pre-commit

# Copy my .bashrc with my aliases into the container
COPY .bashrc /root/.bashrc

# Source the .bashrc file inside the container
# to move the aliases into the container's environment
RUN echo "source /root/.bashrc" >> /root/.bash_profile

# install renv to install the packages from the lockfile
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

# install devtools into the default library location
RUN R -e "install.packages('devtools')"

# Copy the renv lockfile during build into the container
COPY renv.lock renv.lock

# Create a directory inside the container for the renv
RUN mkdir -p renv

# QUESTION - remove? - I think this is useless
RUN mkdir -p renv/library

# Copy the activate.R script into the container
COPY renv/activate.R renv/activate.R

# Disable the renv cache to force installation into the project lib
RUN R -e "renv::init(force = TRUE, settings = list(use.cache = FALSE))"

# Set the env variable for the renv library path
ENV RENV_PATHS_LIBRARY=/home/app/renv/library

# Activate the renv environment
RUN R -e "renv::restore()"

RUN R -e "install.packages('devtools')"

RUN R -e "install.packages('languageserver')"