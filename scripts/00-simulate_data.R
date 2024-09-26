#### Preamble ####
# Purpose: Simulates data for Toronto Shelter occupancy and capacity
# Author: Zhu zhengjie
# Date: 22 September 2024
# Contact: nathan.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed? n/a



#### Workspace setup ####
library(tidyverse)


#### Build simulated data ####

set.seed(853)

sample_size <- 100

# Simulate shelter location, capacity, sector and occupied

simulated_shelter_data <-
  tibble(
         sim_location_city <- sample(c("Etobicoke",  "North York",
                                       "Scarborough", "Toronto",  "Vaughan"),
                                     sample_size,
                                     replace = TRUE),
         sim_capacity_actual_room <- runif(sample_size, 10, 300),
         sim_occupied_room <-
           sim_capacity_actual_room - round(runif(sample_size, 0, 10)),
         sim_sector <- sample(c("Families", "Men Mixed", "Adult",
                                "Women", "Youth"),
                              sample_size,
                              replace = TRUE))
#### Run tests on simulated data sets ####

# Test 1 - Verify the number of room in shelter are numeric

sim_test_1  <- is.numeric(simulated_shelter_data$sim_capacity_actual_room)
sim_test_1

# Test 2 - Verify number of actual room in shelter
sim_test_2_max <- max(simulated_shelter_data$sim_capacity_actual_room)
sim_test_2_min <- min(simulated_shelter_data$sim_capacity_actual_room)
sim_test_2 <- sim_test_2_max <= 300 && sim_test_2_min >= 10
sim_test_2

# Test 3 - Verify number of shelter sample
sim_test_3 <- nrow(simulated_shelter_data)
sim_test_3 == 100

# Test 4 - Verify number of location cities of shelters
sim_test_4 <- length(table(simulated_shelter_data$sim_location_city))
sim_test_4 == 5

# Test 5 - Verify the number of occupied room

sim_test_5_max <- max(simulated_shelter_data$sim_occupied_room)
sim_test_5_min <- min(simulated_shelter_data$sim_occupied_room)
sim_test_5 <- sim_test_5_max <= 300 && sim_test_5_min >= 0
sim_test_5

# Test 6 - Verify the number of occupied room  is less than the
# number of actual room in shelter
sim_test_6 <- simulated_shelter_data$sim_occupied_room <=
  simulated_shelter_data$sim_capacity_actual_room
sim_test_6 <- all(sim_test_6 == "TRUE")
sim_test_6
