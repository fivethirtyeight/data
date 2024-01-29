# Police Deaths

This directory contains the data and code behind the story [The Dallas Shooting Was Among The Deadliest For Police In U.S. History](https://fivethirtyeight.com/features/the-dallas-shooting-was-among-the-deadliest-for-police-in-u-s-history/). The primary source of data is the [Officer Down Memorial Page](https://www.odmp.org/) (ODMP), started in 1996 by a college student who is now a police officer and who continues to maintain the database.

File descriptions:

File | Description
---|-----------
`scrape.R` | Scrapes data on the death of every officer tracked on ODMP
`all_data.csv` | Output of `scrape.R`
`clean.R` | Takes the data in `all_data.csv`, cleans it and formats the dates correctly, and tags every entry as human or canine.
`clean_data.csv` | Output of `clean.R`
`plot.R` | Summarizes police deaths by category and generates a plot similar to the one below

![](https://i1.wp.com/espnfivethirtyeight.files.wordpress.com/2016/07/bialik-flowers-king-police-deaths-1.png)