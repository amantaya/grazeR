# Load necessary libraries
library(dplyr)
library(lubridate)

generate_synthetic_data <- function {
# Set seed for reproducibility
set.seed(123)

# Generate sample data
generate_data <- function(n) {
  data.frame(
    PreliminaryID = 1:n,
    FeederID = sample(1:100, n, replace = TRUE),
    DeploymentID = sample(1:50, n, replace = TRUE),
    FileID = sample(1:200, n, replace = TRUE),
    AnimalName = paste("Animal", sample(1:100, n, replace = TRUE)),
    RFID = sprintf(sample(1:999999999999, n, replace = TRUE)),
    StartTime = sample(seq(ymd_hms('2023-01-01 00:00:00'), ymd_hms('2023-12-31 23:59:59'), by = "hour"), n, replace = TRUE),
    EndTime = sample(seq(ymd_hms('2023-01-01 01:00:00'), ymd_hms('2024-01-01 00:00:00'), by = "hour"), n, replace = TRUE),
    GoodDataDuration = sprintf("%02d:%02d:%02d", sample(0:23, n, replace = TRUE), sample(0:59, n, replace = TRUE), sample(0:59, n, replace = TRUE)),
    CO2GramsPerDay = round(runif(n, 0, 1000), 2),
    CH4GramsPerDay = round(runif(n, 0, 1000), 2),
    O2GramsPerDay = round(runif(n, 0, 1000), 2)
  )
}

# Generate 100 rows of sample data
sample_data <- generate_data(100)

# Print the first few rows of the sample data
print(head(sample_data))

# Optionally, write the data to a CSV file
write.csv(sample_data, "greenfeed_preliminary_data.csv", row.names = FALSE)
}