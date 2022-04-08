#Instalacion de la paqueteria principal
require(dplyr)
library(nycflights13)
library(tidyverse)




################## Dplyr: summarize()

# This function  collapses a data frame to a single row, in general this 
# function is used with group_by()


summarize(flights, delay= mean(dep_delay,na.rm=T))


#the use general of the function is something like this:

by_day <- group_by(flights, year, month, day)

by_day

summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))


# Now we're going to introduce the operator Pipe

by_dest <- group_by(flights, dest)

delay <- summarize(by_dest,count = n(),dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE) )

delay <- filter(delay, count > 20, dest != "HNL")
                   
## Graphic

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)


#If we want to make the process easier we could use pipe

delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")


##### Another useful tool that we can use is count()

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )
ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)


# Convert to a tibble so it prints nicely

#install.packages("Lahman")

require(Lahman)

batting <- as_tibble(Lahman::Batting)

batters <- batting %>%
  group_by(playerID) %>%
  summarize(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )
batters %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() +
  geom_smooth(se = FALSE)


#### Group by Multiple Variables
daily <- group_by(flights, year, month, day)
(per_day <- summarize(daily, flights = n()))

(per_month <- summarize(per_day, flights = sum(flights)))
(per_year <- summarize(per_month, flights = sum(flights)))


## Ungrouping
  daily %>%
  ungroup() %>% 
  summarize(flights = n())
