# Off-year turnout 2023

This directory contains various demographic data about U.S. counties and county-level voter turnout in off-year elections. It was used in the 538 article, “[High suburban turnout may be the new norm](https://abcnews.go.com/538/high-suburban-turnout-new-norm/story?id=105792075),” by Tia Yang, Mary Radcliffe and Holly Fuong (December 21, 2023). 

Each CSV is broken down by state. You can also access selected data used in this analysis from all five states in the spreadsheet `off-year-turnout-2023.xlsx` in this repo, which includes county-level turnout rates in off-year elections since 2011 and 2023 turnout rates in relation to data on race, education, urbanicity and the 2020 presidential election. 

Voter turnout data is included for off-year elections in which a major statewide office, a statewide ballot question or state-legislative elections were on the ballot. 


## Data sources for each state are as follows:

### Virginia
- [Pre-2023 election turnout](https://apps.elections.virginia.gov/SBE_CSV/ELECTIONS/ELECTIONTURNOUT/)
- [2023 election turnout](https://enr.elections.virginia.gov/results/public/Virginia/elections/2023-Nov-Gen/reporting-statuses)
- [2020 election results](https://historical.elections.virginia.gov/)

### Kentucky
- [Election turnout](https://elect.ky.gov/Resources/Pages/Turnout.aspx)
- [2020 election results](https://elect.ky.gov/results/2020-2029/Pages/2020.aspx)

### Ohio
- [Election turnout](https://www.ohiosos.gov/elections/election-results-and-data/)
- [2020 election results](https://www.ohiosos.gov/elections/election-results-and-data/2020/)

### Pennsylvania
- [All data](https://www.electionreturns.pa.gov/ReportCenter/Reports)

### New Jersey
- [Pre-2023 election turnout](https://www.nj.gov/state/elections/election-information-results.shtml)
- [2023 election turnout](https://www.nj.gov/state/elections/election-night-results.shtml)
- [2020 election results](https://www.nj.gov/state/elections/election-information-2020.shtml#general)

### Demographic data
- [Decennial U.S. Census](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/urban-rural.html)
- [Five-year American Community Survey](https://www.census.gov/programs-surveys/acs)


## Codebook

Header | Definition
---|---------
`NAME` | Name of the county
`2023 votes` | Number of votes cast in the 2023 election in each county, per the state’s election records
`2021 votes` | Number of votes cast in the 2021 election in each county, per the state’s election records
`2019 votes` | Number of votes cast in the 2019 election in each county, per the state’s election records
`2017 votes` | Number of votes cast in the 2017 election in each county, per the state’s election records
`2015 votes` | Number of votes cast in the 2015 election in each county, per the state’s election records
`2013 votes` | Number of votes cast in the 2013 election in each county, per the state’s election records
`2011 votes` | Number of votes cast in the 2011 election in each county, per the state’s election records
`pop_total_estimate_18to22` | Estimate of total county population, per 2018-2022 ACS
`cvap_estimate_18to22` | Estimate of total county citizen voting-age population, per 2018-2022 ACS
`cvap_estimate_13to17` | Estimate of total county citizen voting-age population, per 2013-2017 ACS
`cvap_estimate_08to12` | Estimate of total county citizen voting-age population, per 2008-2012 ACS
`2023 cvap_turnout` | 2023 election turnout, calculated as `(2023 votes)/(cvap_estimate_18to22)`
`Change in % turnout from 2019` | Difference between `2023 cvap_turnout` and `2019 cvap_turnout`
`2021 cvap_turnout` | 2021 election turnout, calculated as `(2021 votes)/(cvap_estimate_18to22)`
`2019 cvap_turnout` | 2019 election turnout, calculated as `(2019 votes)/(cvap_estimate_18to22)`
`2017 cvap_turnout` | 2017 election turnout, calculated as `(2017 votes)/(cvap_estimate_13to17)`
`2015 cvap_turnout` | 2015 election turnout, calculated as `(2015 votes)/(cvap_estimate_13to17)`	
`2013 cvap_turnout` | 2013 election turnout, calculated as `(2013 votes)/(cvap_estimate_13to17)`	
`2011 cvap_turnout` | 2011 election turnout, calculated as `(2011 votes)/(cvap_estimate_08to12)`
`Biden margin 2020` | Difference between Biden and Trump's margin of support in the 2020 election. Positive numbers indicate Biden won the county, and negative numbers indicate Trump won it 
`POPPCT_URB_20` | Estimated percentage of the county population living in urban areas, per the 2020 decennial census	
`age_median_estimate_18to22` | Median age of county residents, per the 2018-2022 ACS	
`white_pct_18to22` | Estimated percentage of the county population identifying as white, per the 2018-2022 ACS	
`black_pct_18to22` | Estimated percentage of the county population identifying as Black, per the 2018-2022 ACS	
`hisp_lat_pct_18to22` | Estimated percentage of the county population identifying as Hispanic or Latino, per the 2018-2022 ACS		
`asian_pct_18to22` | Estimated percentage of the county population identifying as Asian American, per the 2018-2022 ACS		
`nh_pi_pct_18to22` | Estimated percentage of the county population identifying as native Hawaiian or Pacific Islander, per the 2018-2022 ACS
`ai_an_pct_18to22` | Estimated percentage of the county population identifying as American Indian or Native American, per the 2018-2022 ACS
`lessHS_25over_pct_18to22` | Estimated percentage of the county population aged 25 or older without a high school degree, per the 2018-2022 ACS
`HSgrad_25over_pct_18to22` | Estimated percentage of the county population aged 25 or older with a high school degree	but no college, per the 2018-2022 ACS
`somecollege_25over_pct_18to22` | Estimated percentage of the county population aged 25 or older with some college, per the 2018-2022 ACS	
`bachhigher_25over_pct_18to22` | Estimated percentage of the county population aged 25 or older with a college degree, per the 2018-2022 ACS
