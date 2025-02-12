test_that("eid >15 char in length returns FALSE", {
  expect_equal(validate_eid_length("1234567890123456"), FALSE)
})

test_that("eid <15 char in length returns FALSE", {
  expect_equal(validate_eid_length("12345678901234"), FALSE)
})

test_that("eid ==15 char in length returns TRUE", {
  expect_equal(validate_eid_length("123456789012345"), TRUE)
})

test_that("eid with incorrect prefix returns FALSE", {
  expect_equal(validate_eid_prefix("123456789012345"), FALSE)
})

test_that("eid with correct prefix returns TRUE", {
  expect_equal(validate_eid_prefix("982012345678901"), TRUE)
})