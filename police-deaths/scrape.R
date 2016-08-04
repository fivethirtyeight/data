# Dallas shooting scraping

library(dplyr)
library(rvest)
library(readr)
library(tidyr)
library(lubridate)
library(stringr)
library(ggplot2)

yearly_url <- 'https://www.odmp.org/search/year/'

years <- seq(1791, 2016)

all_data <- data.frame()

# Scrape data

for (year in years){

  new_url <- paste0(yearly_url, year)

  selector_yearly <- 'p , p a'

  raw_data <- read_html(new_url) %>%
    html_nodes(selector_yearly) %>%
    html_text() %>%
    as.data.frame()

  names(raw_data) <- c("incident")

  clean_data <- raw_data %>%
    separate(incident, sep = '\n\t\t\t\t\t\t\t\t\t',
             into = c("person", "dept","eow", "cause")) %>%
    filter(!is.na(dept))

  all_data <- rbind(all_data, clean_data)

}

write_csv(all_data, "all_data_fallen_officers.csv")
