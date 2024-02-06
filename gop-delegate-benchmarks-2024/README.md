# 538's 2024 GOP primary delegate benchmarks

This directory contains the data behind 538’s 2024 GOP delegate benchmarks interactive.

See also:

* [538's GOP delegate benchmark tracker](https://projects.fivethirtyeight.com/2024-republican-delegate-benchmarks/)
* [DeSantis and Haley need to win early, or it's over](https://abcnews.go.com/538/desantis-haley-win-early/story?id=106254579)

`delegate_targets.csv` contains the latest summary output from the GOP delegate benchmark estimates. Brief descriptions for each column are in the table below. For detailed information, see the methodology section at the bottom of the interactive. 

Header | Definition
---|---------
`state_abb` | State or territory postal abbreviation
`state_name` | Name of the state or territory
`vote_date` | Date of the GOP presidential primary, caucus or convention in the state or territory
`total_delegates` | Total number of delegates to the Republican National Convention from the state or territory
`allocated` | Total number of delegates to the RNC that will be allocated based on the outcome of the primary, caucus or convention in the state or territory
`rules` | Rules by which delegates are allocated in the state or territory
`model_date` | Date when the benchmark estimates were generated
candidate | For each candidate currently in the race, there is a column whose header is that candidate's last name. For jurisdictions that have yet to vote, this column indicates the number of delegates that 538 estimates the candidate would need to win there to be on track to win the nomination. For jurisdictions that have already voted, this column indicates the number of delegates 538 estimated the candidate would need to win there at the time of its primary, caucus or convention.

Previous delegate benchmarks data is available in the folder within this repository, sorted by the date those benchmarks were generated. The codebook for these files is the same as that of `delegate_targets.csv`. (Note: Files generated before Jan. 22, 2024, will include the ABC News estimate of each candidate’s number of delegates for jurisdictions that have already voted instead of the benchmark estimated by 538.)  

Sources: Polls, U.S. Census Bureau, American Community Survey, Public Religion Research Institute, Pew Research Center, ABC News, Edison Research, FrontloadingHQ, Republican National Committee

