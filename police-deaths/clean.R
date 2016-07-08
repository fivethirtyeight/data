# Dallas shooting cleaning

library(dplyr)
library(rvest)
library(readr)
library(tidyr)
library(lubridate)
library(stringr)
library(ggplot2)


all_data <- read.csv('all_data.csv', stringsAsFactors=FALSE)

clean_data <- all_data %>%
  mutate(
    cause_short = gsub('Cause of Death: ', '', cause),
    date = mdy(gsub('EOW: ', '', eow)),
    year = year(date),
    canine = ifelse(substr(person, 0, 2) == 'K9' & substr(person, 0, 10) != 'K9 Officer', TRUE, FALSE)
  )

# Split department and state
dept_state <- strsplit(clean_data$dept, ",(?=[^,]+$)", perl=TRUE)

dept_state_df <- data.frame(matrix(unlist(dept_state), nrow=length(dept_state), byrow=T),stringsAsFactors=FALSE) %>% 
  rename(dept_name=X1, state=X2)

clean_data <- clean_data %>% 
  bind_cols(dept_state_df)

write_csv(clean_data, 'clean_data.csv')
