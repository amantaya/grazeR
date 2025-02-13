test_that("eid >15 char in length returns FALSE", {
  expect_equal(validate_eid_length("1234567890123456"), FALSE)
})

test_that("eid <15 char in length returns FALSE", {
  expect_equal(validate_eid_length("12345678901234"), FALSE)
})

test_that("eid with missing value returns FALSE", {
  expect_equal(validate_eid_length(NA), FALSE)
})

test_that("eid ==15 char in length returns TRUE", {
  expect_equal(validate_eid_length("123456789012345"), TRUE)
})

test_that("eid with incorrect prefix returns FALSE", {
  expect_equal(validate_eid_prefix("123456789012345"), FALSE)
})

test_that("eid with correct 982 prefix returns TRUE", {
  expect_equal(validate_eid_prefix("982012345678901"), TRUE)
})

test_that("eid with correct 985 prefix returns TRUE", {
  expect_equal(validate_eid_prefix("985012345678901"), TRUE)
})

test_that("eid with correct 840 prefix returns TRUE", {
  expect_equal(validate_eid_prefix("840012345678901"), TRUE)
})

test_that("eid with correct 942 prefix returns TRUE", {
  expect_equal(validate_eid_prefix("942012345678901"), TRUE)
})

test_that("eid with correct 949 prefix returns TRUE", {
  expect_equal(validate_eid_prefix("949012345678901"), TRUE)
})

test_that("eid with missing value returns FALSE", {
  expect_equal(validate_eid_prefix(NA), FALSE)
})

test_that("eid with length 15 returns 15", {
  expect_equal(get_eid_length("123456789012345"), 15)
})

test_that("eid with length 0 returns 0", {
  expect_equal(get_eid_length(""), 0)
})

test_that("eid that is NA returns NA", {
  expect_equal(get_eid_length(NA), NA_integer_)
})

test_that("eid as integer of length 15 returns 15", {
  expect_equal(get_eid_length(123456789012345), 15)
})

test_that("get_eid_type returns correct type for valid prefixes", {
  expect_equal(get_eid_type("840012345678901"), "USDA Animal Identification Number")
  expect_equal(get_eid_type("982012345678901"), "Allflex")
  expect_equal(get_eid_type("985012345678901"), "Destron Fearing")
  expect_equal(get_eid_type("942012345678901"), "Zee Tags")
  expect_equal(get_eid_type("949012345678901"), "Y-Tex")
})

test_that("get_eid_type returns NA_character_ for invalid prefix", {
  expect_equal(get_eid_type("123456789012345"), NA_character_)
})

test_that("get_eid_type returns NA_character_ for NA input", {
  expect_equal(get_eid_type(NA), NA_character_)
})

test_that("get_eid_type returns NA_character_ for empty string", {
  expect_equal(get_eid_type(""), NA_character_)
})

test_that("get_eid_prefix returns correct prefix for valid character EID", {
  expect_equal(get_eid_prefix("982012345678901"), "982")
  expect_equal(get_eid_prefix("985012345678901"), "985")
  expect_equal(get_eid_prefix("840012345678901"), "840")
  expect_equal(get_eid_prefix("942012345678901"), "942")
  expect_equal(get_eid_prefix("949012345678901"), "949")
})


test_that("get_eid_prefix returns correct prefix for valid integer EID", {
  expect_equal(get_eid_prefix(982012345678901), "982")
  expect_equal(get_eid_prefix(985012345678901), "985")
  expect_equal(get_eid_prefix(840012345678901), "840")
  expect_equal(get_eid_prefix(942012345678901), "942")
  expect_equal(get_eid_prefix(949012345678901), "949")
})

test_that("get_eid_prefix returns NA_character_ for NA input", {
  expect_equal(get_eid_prefix(NA), NA_character_)
})

test_that("get_eid_prefix returns correct prefix for short EID", {
  expect_equal(get_eid_prefix("123"), "123")
  expect_equal(get_eid_prefix("12"), "12")
  expect_equal(get_eid_prefix("1"), "1")
})

test_that("get_eid_prefix returns empty string for empty input", {
  expect_equal(get_eid_prefix(""), "")
})