#### Preamble ####
# Purpose: Downloads and saves the data from Open Toronto Dataset
# Author: Zhu zhengjie
# Date: 22 September 2024
# Contact: nathan.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed? n/a

#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(tidyverse)

# get package
package <- show_package("21c83b32-d5a8-4106-a54f-010dbe49f6f2")
package

# get all resources for this package
resources <- list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2")

# identify datastore resources; by default, Toronto Open Data sets datastore
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <-
  filter(resources, tolower(format) %in% c("csv", "geojson"))

# load the first datastore resource as a sample
shelter_data <- filter(datastore_resources, row_number() == 1) %>%
  get_resource()


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(shelter_data, "data/raw_data/raw_shelter_data.csv")
