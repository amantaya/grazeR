test_that("renames column", {
  df1 <- data.frame(Record = 1)
  df2 <- rename_record_column(df1)
  expect_named(df2, "Sample")
})
