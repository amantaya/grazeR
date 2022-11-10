docker run -d -e DISABLE_AUTH=true -e ROOT=TRUE --rm -p 127.0.0.3:8787:8787 `
# add local access to grazeR files
-v C:/Users/andre/Dropbox/Dev/grazeR:/home/rstudio/grazeR `
amantaya/rstudio:4.2.1
