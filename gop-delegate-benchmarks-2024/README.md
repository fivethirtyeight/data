# 538's 2024 GOP primary delegate benchmarks

This directory contains the data behind the 538 GOP delegate benchmarks.

See also:

* [538's GOP delegate benchmark tracker](link to interactive)
* [Delegate benchmark methodology title](link to methodology)
* [Delegate benchmark article title](link to article)

`delegate_targets.csv` contains the summary output from the delegate target model. Descriptions for each column are in the table below.

Header | Definition
---|---------
`state_abb` | State postal abbreviation
`state_name` | Name of the state
`vote_date` | Date of the GOP presidential primary or caucus in the state
`total_delegates` | Total number of delegates to the RNC from the state
`allocated` | Total number of delegates to the RNC that will be allocated based on the outcome of the primary or caucus in the state
`rules` | Rules by which delgate allocation is performed in the state. See the [methodology](link to methodology) for details
`model_date` | Date at which the model was run
candidate | For each candidate, there is a column whose header is that candidate's last name. This column indicates the benchmark number of delegates that candidate would need to win in the state to be on track to win the nomination.
