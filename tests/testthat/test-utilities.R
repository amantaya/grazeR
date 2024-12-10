test_that("file sha256 hash is correct", {
    # create a temporary file
    temp_file <- tempfile(fileext = ".txt")
    writeLines("Hello, world!", temp_file)
    # generate the sha256 hash
    sha256_hash <- generate_sha256_hash(temp_file)
    sha256_hash <- as.character(sha256_hash)
    # remove the temporary file
    unlink(temp_file)
    # check if the sha256 hash is correct
    expect_equal(
        sha256_hash,
        "66b01763ad80316783341083c02317e7fdda4391e58cbf02f26f2a92257c5b92"
    )
})

test_that("file md5 hash is correct", {
    # create a temporary file
    temp_file <- tempfile(fileext = ".txt")
    writeLines("Hello, world!", temp_file)
    # generate the sha256 hash
    md5_hash <- generate_md5_hash(temp_file)
    md5_hash <- as.character(md5_hash)
    # remove the temporary file
    unlink(temp_file)
    # check if the sha256 hash is correct
    expect_equal(
        md5_hash,
        "78016cea74c298162366b9f86bfc3b16"
    )
})