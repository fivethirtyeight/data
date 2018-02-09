# College Majors

This folder contains the data and code behind the story [The Economic Guide To Picking A College Major](https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/).

All data is from American Community Survey 2010-2012 Public Use Microdata Series.

Download data here: http://www.census.gov/programs-surveys/acs/data/pums.html

Documentation here: http://www.census.gov/programs-surveys/acs/technical-documentation/pums.html

`college-majors-rscript.R`
- Assumes you've already downloaded the data and selected only records with non-NA values for college major (FOD1P)
- Outputs data to csv

`majors-list.csv`
- List of majors with their FOD1P codes and major categories.
- Major categories are from Carnevale et al, "What's It Worth?: The Economic Value of College Majors." Georgetown University Center on Education and the Workforce, 2011. http://cew.georgetown.edu/whatsitworth

Three main data files:
- `all-ages.csv`
- `recent-grads.csv` (ages <28)
- `grad-students.csv` (ages 25+)

All contain basic earnings and labor force information. `recent-grads.csv` contains a more detailed breakdown, including by sex and by the type of job they got. `grad-students.csv` contains details on graduate school attendees.

Additionally, `women-stem.csv` contains data for scatter plot in associated DataLab post on women in science/technology jobs. It is a subset of `recent-grads.csv`. (Small easter egg: Check out my related Shiny app: https://bencasselman.shinyapps.io/new-test/)

Headers for `recent-grads.csv` are shown below:

Header | Description
---|---------
`Rank` | Rank by median earnings
`Major_code` | Major code, FO1DP in ACS PUMS
`Major` | Major description
`Major_category` | Category of major from Carnevale et al
`Total` | Total number of people with major
`Sample_size` | Sample size (unweighted) of full-time, year-round ONLY (used for earnings)
`Men` | Male graduates
`Women` | Female graduates
`ShareWomen` | Women as share of total
`Employed` | Number employed (ESR == 1 or 2)
`Full_time` | Employed 35 hours or more
`Part_time` | Employed less than 35 hours
`Full_time_year_round` | Employed at least 50 weeks (WKW == 1) and at least 35 hours (WKHP >= 35)
`Unemployed` | Number unemployed (ESR == 3)
`Unemployment_rate` | Unemployed / (Unemployed + Employed)
`Median` | Median earnings of full-time, year-round workers
`P25th` | 25th percentile of earnigns
`P75th` | 75th percentile of earnings
`College_jobs` | Number with job requiring a college degree
`Non_college_jobs` | Number with job not requiring a college degree
`Low_wage_jobs` | Number in low-wage service jobs