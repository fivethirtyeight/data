# Off-year turnout 2023

This directory contains data used in [article hed](link to article). For more information about how this data was gathered, please consult the methodoogy section in this article.

You can also read this data on [this spreadsheet](https://docs.google.com/spreadsheets/d/1ciZiaWvmEJKyGcjFampdh86bW9j0tS77-XoiE4LEUng/edit#gid=0).

Data sources for each state are as follows:

### Virginia
- [pre-2023 election turnout](https://apps.elections.virginia.gov/SBE_CSV/ELECTIONS/ELECTIONTURNOUT/)
- [2023 election turnout](https://enr.elections.virginia.gov/results/public/Virginia/elections/2023-Nov-Gen/reporting-statuses)
- [2020 election results](https://historical.elections.virginia.gov/)

### Kentucky
- [election turnout](https://elect.ky.gov/Resources/Pages/Turnout.aspx)
- [2020 election results](https://elect.ky.gov/results/2020-2029/Pages/2020.aspx)

### Ohio
- [election turnout](https://www.ohiosos.gov/elections/election-results-and-data/)
- [2020 election results](https://www.ohiosos.gov/elections/election-results-and-data/2020/)

### Pennsylvania
- [all data](https://www.electionreturns.pa.gov/ReportCenter/Reports)

### New Jersey
- [pre-2023 election turnout](https://www.nj.gov/state/elections/election-information-results.shtml)
- [2023 election turnout](https://www.nj.gov/state/elections/election-night-results.shtml)
- [2020 election results](https://www.nj.gov/state/elections/election-information-2020.shtml#general)

### Demographic Data
- [Decennial U.S. Census](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/urban-rural.html)
- [five-year American Community Survey](https://www.census.gov/programs-surveys/acs)


# Codebook

Header | Definition
---|---------
`NAME` | Name of the county
`pop_total_estimate_18to22` | Estimate of total county population, per 2018-2022 ACS
`cvap_estimate_18to22` | Estimate of total county citizen voting-age population, per 2018-2022 ACS
`2023 cvap_turnout` | 2023 election turnout, calculated as `(total votes cast)/(cvap_estimate_18to22)`
`Change in % turnout from 2019` | Difference between `2023 cvap_turnout` and `2021 cvap_turnout`
`2021 cvap_turnout` | 2021 election turnout, calculated as `(total votes cast)/(cvap_estimate_18to22)`
`2019 cvap_turnout` | 2019 election turnout, calculated as `(total votes cast)/(cvap_estimate_18to22)`
`2017 cvap_turnout` | 2017 election turnout, calculated as `(total votes cast)/(cvap_estimate_13to17)`, where `cvap_estimate_13to17` is the estamated citizen voting-age population per the 2013-2017 ACS
`2015 cvap_turnout` | 2015 election turnout, calculated as `(total votes cast)/(cvap_estimate_13to17)`	
`2013 cvap_turnout` | 2013 election turnout, calculated as `(total votes cast)/(cvap_estimate_13to17)`	
`2011 cvap_turnout` | 2011 election turnout, calculated as `(total votes cast)/(cvap_estimate_08to12)`, where `cvap_estimate_08to12` is the estamated citizen voting-age population per the 2008-2012 ACS	
`Biden margin 2020` | Difference between Biden and Trump's margin of support in the 2020 election. Note that positive numbers indicate Biden won the county, and negative numbers indicate Trump won	
`POPPCT_URB_20` | Estimated percentage of the county population living in urban areas, per the 2020 decennial census	
`age_median_estimate_18to22` | Median age of county residents, per the 2018-2022 ACS	
`white_pct_18to22` | Estimated percentage of the county population identifying as white, per the 2018-2022 ACS	
`black_pct_18to22` | Estimated percentage of the county population identifying as black, per the 2018-2022 ACS	
`hisp_lat_pct_18to22` | Estimated percentage of the county population identifying as hispanic or latino, per the 2018-2022 ACS		
`asian_pct_18to22` | Estimated percentage of the county population identifying as asian, per the 2018-2022 ACS		
`nh_pi_pct_18to22` | Estimated percentage of the county population identifying as native Hawaiian or Pacific Islander, per the 2018-2022 ACS
`ai_an_pct_18to22` | Estimated percentage of the county population identifying as American Indian or Native American, per the 2018-2022 ACS
`lessHS_25over_pct_18to22` | Estimated percentage of the county population over the age of 25 without a high school degree, per the 2018-2022 ACS
`HSgrad_25over_pct_18to22` | Estimated percentage of the county population over the age of 25 with a high school degree	but no college, per the 2018-2022 ACS
`somecollege_25over_pct_18to22` | Estimated percentage of the county population over the age of 25 with some college, per the 2018-2022 ACS	
`bachhigher_25over_pct_18to22` | Estimated percentage of the county population over the age of 25 with a college degree, per the 2018-2022 ACS
