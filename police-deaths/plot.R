# Dallas shooting cleaning

library(dplyr)
library(rvest)
library(readr)
library(tidyr)
library(lubridate)
library(stringr)
library(ggplot2)
library(magrittr)

clean_data <- read_csv('clean_data.csv')

# Remove canines
persons_data <- clean_data %>% 
  filter(canine == FALSE) 

# Filter for major categories
large_categories <- persons_data %>%
      group_by(year, cause_short) %>%
      summarize(count = n()) %>%
      data.frame() %>%
      filter(count >= 20) %>%
      select(cause_short) %>%
      unique()

# Categories to plot 
cat_to_plot <- c(large_categories$cause_short, "Gunfire (Accidental)")

plot_order <- persons_data %>%
    mutate(cat = ifelse(cause_short %in% cat_to_plot, cause_short, 'other')) %>%
    group_by(cat) %>%
    summarize(count = n()) %>%
    data.frame() %>%
    arrange(desc(count)) %>%
    extract2(1)

# Move order to the end
plot_order <- c(plot_order[! (plot_order == 'other')], 'other')
    

# Create data for plotting
data_for_plot <- persons_data %>%
      mutate(cat = ifelse(cause_short %in% cat_to_plot, cause_short, 'other')) %>%
      group_by(year, cat) %>%
      summarize(count = n()) %>%
      data.frame() %>%
      spread(cat, count)

data_for_plot[is.na(data_for_plot)] <- 0

data_for_plot <- data_for_plot %>%
      gather(cat, count, -year) %>%
      mutate(cat = factor(cat, levels=plot_order)) %>%
      arrange(cat)

# Deaths by cause
p_area <- ggplot(data_for_plot, aes(x=year, y=count, group=cat, order=cat)) +
      geom_area(aes(fill=cat), position='stack')