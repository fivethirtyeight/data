library(magrittr)
library(rvest)
library(purrr)
library(dplyr)


# Get the links to the HTML tables
  paths <- paste0("https://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7_",
                  seq(from = 1900L, to = 2020L, by = 10L),
                  ".html")
  names(paths) <- seq(from = 1900L, to = 2020L, by = 10L)

# Import the HTML pages
  html_sources <- map(.x = paths,
                      .f = read_html)

# Define a helper function to extract and format the tables from each page
  extract_table <- function(html_source) { 
    cleaned_df <- html_source %>% 
    html_nodes(xpath = '//*[@id="wp1004907table999968"]') %>% 
    html_table(fill = TRUE) %>% 
    {df <- .[[1]]
    new_col_names <- paste(colnames(df),
                           unlist(df[1,]),
                           sep = " - ")
    colnames(df) <- new_col_names
    
    select(df, starts_with('Male'), starts_with('Female')) %>% 
      slice(-(1:2)) %>% 
      filter_all(.vars_predicate = any_vars(. != ""))}
    
    male_df <- select(cleaned_df, starts_with('Male'))
    female_df <- select(cleaned_df, starts_with('Female'))
    
    names(male_df) <- c("x", "qx", "lx", "dx", "Lx", "Tx", "ex")
    names(female_df) <- c("x", "qx", "lx", "dx", "Lx", "Tx", "ex")
    
    bind_rows(mutate(male_df, Sex = 'Male'),
              mutate(female_df, Sex = 'Female')) %>% 
      select(Sex, everything())
  }
  
# Obtain the tables from each page
  table_7_1900_2020 <- map_dfr(.x = html_sources,
                               .f = extract_table,
                               .id = "Decade") %>% 
    mutate_at(.vars = vars(-Decade, -Sex),
              .funs = function(x) str_replace_all(x, ",", "") %>% as.numeric) %>% 
    mutate(Decade = as.integer(Decade),
           x = as.integer(x))
  
  # Heading key
  # Obtained from: https://www.ssa.gov/oact/NOTES/as120/LifeTables_Body.html#wp1168594
  #                Notes for Actuarial Study No. 120 by Felicitie C. Bell and Michael L. Miller
  #                From section "IV. Methods, Part A. Definitions of Life Table Functions"
  # Note that the counts in the table are based 
  # on a hypothetical cohort of 100,000 persons.
  heading_key <- c("x" = "Age",
                   "qx" = "The probability that a person exact age x will die within 1 year.",
                   "lx" = "The number of persons surviving to exact age x",
                   "dx" = "The number of deaths between exact ages x and x+1",
                   "Lx" = "The number of person-years lived between exact ages x and x+1",
                   "Tx" = "The number of person-years lived after exact age x",
                   "ex" = "The average number of years of life remaining for members of the cohort still alive at exact age x. Called the 'life expectancy', for short.")
  
