# Unisex Names

This directory contains the code and data behind the story [The Most Common Unisex Names In America: Is Yours One Of Them?](http://fivethirtyeight.com/features/there-are-922-unisex-names-in-america-is-yours-one-of-them)

The script `unisex_names.R` generates the data in `unisex_names_table.csv`, which contains the over 900 names given to each sex at least one-third of the time and with a minimum of 100 people. It has the following variables:

Header | Definition
---|---------
`name` | First names from the [Social Security Administration](http://www.ssa.gov/oact/babynames/limits.html)
`total` | Total number of living Americans with the name
`male_share` | Percentage of people with the name who are male
`female_share` | Percentage of people with the name who are female
`gap` | Gap between male_share and female_share
