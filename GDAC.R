library(tidyverse)

superbowl <- read_csv("C:\\Users\\User\\Downloads\\gd_tweets_2023_FULL.csv")
head(superbowl)
glimpse(superbowl)

superbowl_clean <- superbowl %>% 
  select(-timestamp) %>% 
  select(-team_name) %>% 
  select(-withheld.scope) %>% 
  select(-withheld.country_codes) %>% 
  select(-withheld.country_codes_y) %>% 
  
  select(-geo.place_id,)

find_na <- function(x) sum(is.na(x))
map(.x = superbowl_clean, .f = find_na) %>% 
  unlist() %>% 
  data.frame()

a <- length(superbowl_clean$geo.place_id)

1898069/1916335

superbowl_clean %>% 
  group_by(brand_ad_name) %>% 
  #summarize(n=n()) %>% 
  arrange(desc(summarize = n()))
  