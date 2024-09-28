#### Preamble ####
# Purpose: Cleans the data
# Author: Xue Feiyang
# Date: 23 September 2024 
# Contact: feiyang.xue@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE
# Any other information needed? NONE

# Load necessary libraries
library(tidyverse)

# Load the dataset
data <- read_csv("data/raw_data/raw_data.csv")

# Select only the important columns
data <- data %>%
  select(AGENCY_NAME, ORGANIZATION_ADDRESS, NEIGHBOURHOOD, OFFICE_PHONE, ELIGIBILITY, DESCRIPTION_SERVICE, POSTAL_CODE)

# View the selected data
head(data)

# Check for missing data in the important columns
sapply(data, function(x) sum(is.na(x)))



# Remove duplicate rows
data <- data %>% distinct()

# Standardize text columns
data <- data %>%
  mutate(
    AGENCY_NAME = str_trim(AGENCY_NAME),
    ORGANIZATION_ADDRESS = str_trim(ORGANIZATION_ADDRESS),
    AGENCY_NAME = str_to_title(AGENCY_NAME),
    NEIGHBOURHOOD = str_to_title(NEIGHBOURHOOD)
  )

# Save the cleaned dataset
write_csv(data, "data/analysis_data/analysis_data.csv")

