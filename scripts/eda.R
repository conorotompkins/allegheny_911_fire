library(tidyverse)
library(janitor)

theme_set(theme_bw())

url <- "https://data.wprdc.org/dataset/abba9671-a026-4270-9c83-003a1414d628/resource/ff33ca18-2e0c-4cb5-bdcd-60a5dc3c0418/download/911-ems-dispatches.csv"
df_911 <- read_csv(url) %>% 
  clean_names()

df_911 %>% 
  count(call_year, call_quarter) %>% 
  mutate(ts = str_c(call_year, call_quarter),
         ts = fct_inorder(ts)) %>% 
  ggplot(aes(ts, n, group = 1)) +
  #geom_line() +
  geom_point() +
  geom_smooth() +
  labs(title = "Allegheny County EMS Dispatches",
       subtitle = "Data from @WPRDC",
       x = "Year-Quarter",
       y = "Count",
       caption = "@conor_tompkins")

df_911 %>% 
  count(description_short, sort = TRUE)