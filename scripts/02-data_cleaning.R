#### Preamble ####
# Purpose: Cleans the raw shelter data recorded Open Toronto Dataset
# Author: Zhu zhengjie
# Date: 22 September 2024
# Contact: nathan.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed? n/a

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_shelter_data.csv")

# choose the variable of interest

cleaned_data <- raw_data %>%
  select("LOCATION_CITY", "SECTOR", "CAPACITY_ACTUAL_ROOM",
         "OCCUPIED_ROOMS") %>%
  na.omit()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_shelter_data.csv")
