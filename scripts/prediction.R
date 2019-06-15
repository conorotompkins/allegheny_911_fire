library(tidyverse)
library(lubridate)
library(prophet)
library(janitor)

df_test <- df_911 %>% 
  select(call_year) %>%
  filter(call_year < 2019) %>% 
  #mutate(call_year = as.Date(call_year, origin = "1960-01-01")) %>% 
  count(call_year) %>% 
  rename(ds = call_year,
         y = n)
df_test

m <- prophet(df_test)
