# 04-GreenFeed-R-Package

#TODO - add repo status badge

#TODO - add GitHub action for R CMD check

#TODO - add GitHub action for lintr

#TODO - add GitHub action for styler

> **Note:**
> This R package is currently not available on CRAN, but you can install it from GitHub (instructions below)

## How to Install this R Package from GitHub

Since this is a private repo, you will need to set a GitHub PAT (Personal Access Token) in your R environment to allow `devtools` the ability to access the private repo.

(Note: your GitHub username needs to be added to the repository before you can access this repo.)

There are a couple of ways to set a GitHub PAT in your R environment:

### Option 1:

```R
Sys.setenv(GITHUB_PAT = "your_personal_access_token")
```

### Option 2:

Add `GITHUB_PAT=your_personal_access_token` to your `.Renviron` file.

You will need to close your R session a start a new R session to re-load the env vars.

(Note: double-quotes are not needed in `.Renviron` file)

### Option 3:

Use `gitcreds::gitcreds_set()` and unset GITHUB_PAT in .Renviron (or elsewhere) if you want to use the more secure git credential store instead.

### Install R Package Using `devtools`

```R
devtools::install_github("amantaya/04-GreenFeed-R-Package")
```
