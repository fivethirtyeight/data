#-------------------------------------------------------------------------------
# Dallas shooting scraping
#-------------------------------------------------------------------------------

library(tidyverse)
library(rvest)

# Scrape data
df <- paste0("https://www.odmp.org/search/year/", seq(1791, 2016)) %>% 
  as_tibble() %>% 
  set_names("url") %>% 
  mutate(
    data = map(url, read_html),
    nodes = map(data, html_nodes, '[class="officer-short-details"]'),
    text = map(nodes, html_text),
    clean_text = map(text, str_trim),
    clean_text = map(clean_text, str_replace_all, "\n", " separator"),
    clean_data = map(clean_text, as.data.frame),
    clean_data = map(clean_data, set_names, "string"),
    clean_data = map(clean_data, separate, string, c("person", "dept", "eow", "cause"), "separator")
  ) %>% 
  select(clean_data) %>% 
  unnest() %>% 
  mutate_all(str_squish)

# Write to CSV
write_csv(df, "all_data_fallen_officers.csv")
