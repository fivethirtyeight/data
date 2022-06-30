---
files:
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_national_toplines_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_national_toplines_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_state_toplines_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_district_toplines_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/governor_state_toplines_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_seat_distribution_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_seat_distribution_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_steps_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_steps_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/governor_steps_2022.csv
 - https://projects.fivethirtyeight.com/2022-general-election-forecast-data/joint_probabilities_2022.csv
---

| Links to Files |
| ----------- |
| [`senate_national_toplines_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_national_toplines_2022.csv) | ✓
| [`house_national_toplines_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_national_toplines_2022.csv) | ✓
| [`senate_state_toplines_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_state_toplines_2022.csv) | ✓
| [`house_district_toplines_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_district_toplines_2022.csv) | ✓
| [`governor_state_toplines_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/governor_state_toplines_2022.csv) | ✓
| [`senate_seat_distribution_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_seat_distribution_2022.csv) | ✓
| [`house_seat_distribution_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_seat_distribution_2022.csv) | ✓
| [`senate_steps_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/senate_steps_2022.csv) | ✓
| [`house_steps_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/house_steps_2022.csv) | ✓
| [`governor_steps_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/governor_steps_2022.csv) | ✓
| [`joint_probabilities_2022.csv`](https://projects.fivethirtyeight.com/2022-general-election-forecast-data/joint_probabilities_2022.csv) | ✓

# election-forecasts-2022

This file contains links to the data behind our [2022 Midterms Election Forecast](https://projects.fivethirtyeight.com/2022-election-forecast/).

`senate_national_toplines_2022.csv` contains the final national Senate topline on each day. This sheet contains the following columns:

Column | Description
-------|------------
`cycle` | Cycle this forecast pertains to (`2022`)
`branch` | Kind of race this forecast pertains to (`senate`)
`expression` | Model type (`lite`, `classic`, or `deluxe`)
`forecastdate` | Date the model was run
`chamber_Dparty`, `chamber_Rparty` | Chance that each party (D or R) win control of the Senate
`mean_seats_Dparty`, `mean_seats_Rparty` | Average forecasted number of seats that each party (D or R) hold in the Senate
`median_seats_Dparty`, `median_seats_Rparty` | Median forecasted number of seats that each party (D or R) hold in the Senate
`p90_seats_Dparty`,`p90_seats_Rparty`,`p10_seats_Dparty`,`p10_seats_Rparty` | 90th and 10th percentile for the number of seats for each party (D or R)
`total_national_turnout`, `p90_total_national_turnout`, `p10_total_national_turnout` | Average, 90th percentile, and 10th percentile of national turnout in states with Senate races
`popvote_margin`, `p90_popvote_margin`, `p10_popvote_margin` | Average, 90th percentile, and 10th percentile of popular vote margin (with positive being more Democratic and negative more Republican) in Senate races
`simulations` | Number of simulations run
`timestamp` | Date and time the simulations were run

`house_national_toplines_2022.csv` contains the final national House topline on each day. This sheet contains the following additional columns:

Column | Description
-------|------------
`statesmajority_Dparty`, `statesmajority_Rparty`, `statesmajority_noparty` | Forecasted chances that each party, or no party, controls a majority of state delegations in the house
`delegations_Dparty`, `delegations_Rparty`, `delegations_nomajority` | How many state delegations each party is expected to control in the house

`senate_state_toplines_2022.csv`, `house_district_toplines_2022.csv` and `governor_state_toplines_2022.csv` contain the final state-level Senate toplines and district-level House toplines on each day. These sheets contain the following additional columns:

Column | Description
-------|------------
`district` | Senate seat corresponding to this row, in the format `XX-B#`, where `XX` is the state postal code, `B` is the branch ("S" for Senate, "G" for Governor and blank for House) and `#` is the class of the seat being contested
`name_D1`, `name_D2`,`name_D3`,`name_D4`,`name_R1`, `name_R2`,`name_R3`,`name_R4` | Name of the top four Democrats (D) and Republicans (R) in contention for the seat. Blanks indicate that there are no Democrats or Republicans other than those listed in contention for the seat.
`name_I1` | Name of the top candidate on the ballot that is neither a Democrat nor a Republican.
`name_O1` | Placeholder for model chances for all candidates other than those named in the previous columns.
`winner_XX`, where `XX` is one of `D1`,`D2`,`D3`,`D4`,`R1`,`R2`,`R3`,`R4`,`I1`,`O1` | Chance that the correspondingly named candidate wins the seat
`winner_Dparty`, `winner_Rparty` | Chance that the corresponding party, regardless of candidate, wins the seat
`tipping` | Chance that this seat is the tipping point for control of the Senate
`vpi` | Voter power index: the relative likelihood that an individual vote in the state will determine control of the Senate chamber
`mean_predicted_turnout`, `p90_simmed_turnout_gross`,`p10_simmed_turnout_gross` | Average, 90th percentile, and 10th percentile of state turnout in this Senate race
`voteshare_mean_XX`, where `XX` is one of `D1`,`D2`,`D3`,`D4`,`R1`,`R2`,`R3`,`R4`,`I1`,`O1` | Average voteshare for the correspondingly named candidate
`p90_voteshare_simmed_XX`, `p10_voteshare_simmed_XX`, where `XX` is one of `D1`,`D2`,`D3`,`D4`,`R1`,`R2`,`R3`,`R4`,`I1`,`O1` | 90th and 10th percentile for voteshare for the correspondingly named candidate
`pvi_538` | Partisan voter index for the state, as calculated by 538
`vep` | Total voting eligible population in the state
`mean_netpartymargin`, `p90_netpartymargin`, `p10_netpartymargin` | Mean, 90th, and 10th percentiles of the margin between Democrats and Republicans, where positive numbers are more Democratic and negative numbers are more Republican
`won_runoff_XX`, `lost_runoff_XX`, where `XX` is one of `D1`,`D2`,`D3`,`D4`,`R1`,`R2`,`R3`,`R4`,`I1`,`O1` | Where applicable, chance the the correspondingly named candidate wins in a runoff for the seat

`senate_seat_distribution_2022.csv` and `house_seat_distribution_2022.csv` contain the probablity of each distribution of seats for each day's forecast run. These sheets contain the following additional columns:

Column | Description
-------|------------
`seatsheld` | number of seats held by each party
`seatprob_Dparty` | probability that Democrats will hold `seatsheld` number of seats
`seatprob_Rparty` | probability that Republicans will hold `seatsheld` number of seats

`senate_steps.csv`, `house_steps.csv` and `governor_steps.csv` contain intermediate calculation steps performed in calculating the chance of winning from the polling average in a particular state.

Column | Description
-------|------------
`candidateA`, `candidateB` | Full names of the first and second candidates in the race
`displaystep` | A value from 1-4 indicating the order in which each calculation step is performed
`description` | A description of each step
`margin` | Forecasted margin in this step for `candidateA` - `candidateB`
`lite_weight`, `classic_weight`, `deluxe_weight` | Relatively how much of each forecast that is derived from each component during the calculation of this step

`joint_probabilities.csv` contains the probabilities of each possible combination of Democratic or Republican control of the Senate and House. This sheets contains the following additional columns:

Column | Description
-------|------------
`expression` | `_lite`, `_classic` or `_deluxe`
`DsenateDhouse`, `DsenateRhouse`, `RsenateDhouse`, `RsenateRhouse` | Probability of each possible outcome for Democratic or Republican control of the Senate and House
