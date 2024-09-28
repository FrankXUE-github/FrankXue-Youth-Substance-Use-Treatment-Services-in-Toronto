#### Preamble ####
# Purpose: Simulating Data
# Author: Xue Feiyang
# Date: 23 September 2024 
# Contact: feiyang.xue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
set.seed(123)  # For reproducibility
library(tidyverse)

#### Simulate data ####
n <- 100  # Number of observations

# Simulate random agency names
agency_names <- paste("Agency", sample(LETTERS, n, replace = TRUE), sample(1:100, n, replace = TRUE))

# Simulate random addresses
addresses <- paste(sample(1:999, n, replace = TRUE), sample(c("Main St", "Broadway", "King St", "Queen St", "Bloor St"), n, replace = TRUE))

# Simulate random neighborhoods
neighborhoods <- sample(c("Downtown", "Midtown", "Scarborough", "Etobicoke", "North York"), n, replace = TRUE)

# Simulate random phone numbers
office_phone <- paste0("416-", sample(100:999, n, replace = TRUE), "-", sample(1000:9999, n, replace = TRUE))

# Simulate random email addresses
emails <- paste0(tolower(gsub(" ", ".", agency_names)), "@example.com")

# Simulate random websites
websites <- paste0("www.", tolower(gsub(" ", "-", agency_names)), ".org")

# Simulate random eligibility criteria
eligibility <- sample(c("Youth", "Adults", "Seniors", "All ages"), n, replace = TRUE)

# Simulate random service descriptions
services <- sample(c("Counseling", "Crisis intervention", "Support groups", "Rehabilitation", "Day treatment"), n, replace = TRUE)

# Simulate geographical coordinates around Toronto
longitude <- rnorm(n, mean = -79.3832, sd = 0.01)  # Simulated longitude
latitude <- rnorm(n, mean = 43.6532, sd = 0.01)    # Simulated latitude

# Simulate postal codes
postal_codes <- paste0(sample(LETTERS, n, replace = TRUE), sample(1:9, n, replace = TRUE), sample(LETTERS, n, replace = TRUE), " ", 
                       sample(1:9, n, replace = TRUE), sample(LETTERS, n, replace = TRUE), sample(1:9, n, replace = TRUE))

# Simulate the full data frame
simulated_data <- tibble(
  AGENCY_NAME = agency_names,
  ORGANIZATION_ADDRESS = addresses,
  NEIGHBOURHOOD = neighborhoods,
  OFFICE_PHONE = office_phone,
  EMAIL = emails,
  WEBSITE = websites,
  ELIGIBILITY = eligibility,
  DESCRIPTION_SERVICE = services,
  LONGITUDE = longitude,
  LATITUDE = latitude,
  POSTAL_CODE = postal_codes
)

#### Write_csv ####
# Check if the directory exists; if not, create it
if (!dir.exists("data/raw_data")) {
  dir.create("data/raw_data", recursive = TRUE)
}

# Save the simulated data
write_csv(simulated_data, file = "data/raw_data/simulated.csv")

