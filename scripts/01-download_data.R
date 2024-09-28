#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author:  Xue Feiyang
# Date: 23 September 2024 
# Contact: feiyang.xue@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE
# Any other information needed? NONE


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


# get package
package <- show_package("4db2d9d9-6590-41e6-bf2b-b9188436d044")
package


# get all resources for this package
resources <- list_package_resources("4db2d9d9-6590-41e6-bf2b-b9188436d044")


# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))


# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data


#### Save data ####
# Create the necessary folder structure if it doesn't exist
if (!dir.exists("data/raw_data")) {
  dir.create("data/raw_data", recursive = TRUE)
}

# Save the data to the correct folder
write.csv(data, "data/raw_data/raw_data.csv", row.names = FALSE)

