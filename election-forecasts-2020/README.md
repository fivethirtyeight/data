---
files:
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_national_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_state_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_polls_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_poll_averages_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_ev_probabilities_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_scenario_analysis_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_forecast_steps.csv
 - https://projects.fivethirtyeight.com/2020-general-data/economic_index.csv
 - https://projects.fivethirtyeight.com/2020-general-data/electoral_college_vs_popvote.csv
 - https://projects.fivethirtyeight.com/2020-general-data/senate_national_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/senate_state_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/house_national_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/house_district_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/senate_fundamentals.csv
 - https://projects.fivethirtyeight.com/2020-general-data/house_fundamentals.csv
 - https://projects.fivethirtyeight.com/2020-general-data/senate_seat_distribution.csv
 - https://projects.fivethirtyeight.com/2020-general-data/house_seat_distribution.csv
 - https://projects.fivethirtyeight.com/2020-general-data/senate_steps.csv
 - https://projects.fivethirtyeight.com/2020-general-data/house_steps.csv
 - https://projects.fivethirtyeight.com/2020-general-data/joint_probabilities.csv
---

# election-forecasts-2020

This file contains links to the data behind our [2020 General Election Forecast](https://projects.fivethirtyeight.com/2020-election-forecast/).


## Presidential Forecast
`presidential_national_toplines_2020.csv` contains the final national topline on each day. It includes the following columns:

Column | Description
-------|------------
`cycle` | The election cycle (2020)
`branch` | The kind of race this forecast pertains to (presidential)
`model` | The model type (polls-plus is the only model we are running for the 2020 presidential race)
`modeldate` | Date of the model run
`candidate_inc` | Name of the incumbent
`candidate_chal` | Name of the challenger
`candidate_3rd` | Name of the third-party candidate
`ecwin_inc` | Chance that the incumbent will win a majority of the electoral votes
`ecwin_chal` | Chance that the challenger will win a majority of the electoral votes
`ecwin_3rd` | Chance that the third-party candidate will win a majority of the electoral votes
`ec_nomajority` | Chance that no candidate will win a majority of the electoral votes
`popwin_inc` | Chance that the incumbent will win the popular vote
`popwin_chal` | Chance that the challenger will win the popular vote
`popwin_3rd` | Chance that a third-party candidate will win the popular vote
`ev_inc`, `ev_inc_lo`, `ev_inc_hi` | Forecasted number of Electoral College votes for the incumbent, including the upper and lower bounds of an 80% confidence interval
`ev_chal`, `ev_chal_lo`, `ev_chal_hi` | Forecasted number of Electoral College votes for the challenger, including the upper and lower bounds of an 80% confidence interval
`ev_3rd`, `ev_3rd_lo`, `ev_3rd_hi` | Forecasted number of Electoral College votes for the third-party candidate, including the upper and lower bounds of an 80% confidence interval
`national_voteshare_inc`, `national_voteshare_inc_lo`, `national_voteshare_inc_hi`| Forecasted national vote share for the incumbent, including the upper and lower bounds of an 80% confidence interval
`national_voteshare_chal`, `national_voteshare_chal_lo`, `national_voteshare_chal_hi` | Forecasted national vote share for the challenger, including the upper and lower bounds of an 80% confidence interval
`national_voteshare_3rd`, `national_voteshare_3rd_lo`, `national_voteshare_3rd_hi` | Forecasted national vote share for the third-party candidate, including the upper and lower bounds of an 80% confidence interval
`nat_voteshare_other`, `nat_voteshare_other_lo`, `nat_voteshare_other_hi` | Forecasted national voter turnout based on past turnout, estimates of population growth, polls about whether voters are more or less enthusiastic about the election than usual and other factors in each state. Includes the upper and lower bounds of an 80% confidence interval.
`national_turnout`, `national_turnout_lo`, `national_turnout_hi` | Forecasted national voter turnout based on past turnout, estimates of population growth, polls about whether voters are more or less enthusiastic about the election than usual and other factors in each state. Includes the upper and lower bounds of an 80% confidence interval. Turnout estimates are only available on model runs after Sept. 5, 2020.
`timestamp` | Date and time the simulations were run
`simulations` | Number of simulations run


`presidential_state_toplines_2020.csv` contains the final state-level toplines on each day. This sheet contains the following additional columns:


Column | Description
-------|------------
`state` | Name of the state
`tipping` | Tipping-point chance, the chance the state will deliver the decisive vote in the Electoral College
`vpi` | Voter power index, the relative likelihood that an individual voter in the state will determine the Electoral College winner
`winstate_inc` | Chance the incumbent will win the state
`winstate_chal` | Chance the challenger will win the state
`winstate_3rd` | Chance the third-party candidate will win the state
`voteshare_inc`, `voteshare_inc_lo`, `voteshare_inc_hi` | Forecasted vote share for the incumbent, including the upper and lower bounds of an 80% confidence interval
`voteshare_chal`, `voteshare_chal_lo`, `voteshare_chal_hi` | Forecasted vote share for the challenger, including the upper and lower bounds of an 80% confidence interval
`voteshare_3rd`, `voteshare_3rd_lo`, `voteshare_3rd_hi` | Forecasted vote share for the third-party candidate, including the upper and lower bounds of an 80% confidence interval
`voteshare_other`, `voteshare_other_lo`, `voteshare_other_hi` | Forecasted vote share for other candidates, including the upper and lower bounds of an 80% confidence interval
`margin`, `margin_lo`, `margin_hi` | Forecasted margin for the incumbent, including the upper and lower bounds of an 80% confidence interval
`win_EC_if_win_state_inc` | Chance that the incumbent will win the Electoral College if they win this state
`win_EC_if_win_state_chal` | Chance that the challenger will win the Electoral College if they win this state
`win_state_if_win_EC_inc` | Chance that the incumbent will win this state if they win the Electoral College
`win_state_if_win_EC_chal` | Chance that the challenger will win this state if they win the Electoral College
`state_turnout`, `state_turnout_hi`, `state_turnout_lo` | Forecasted state-level voter turnout based on past turnout, estimates of population growth, polls about whether voters are more or less enthusiastic about the election than usual and other factors in each state. Includes the upper and lower bounds of an 80% confidence interval. Turnout estimates are only available on model runs after Sept. 5, 2020.

`presidential_polls_2020.csv` contains an entry for each poll, and how much the model adjusts each poll for the house and trendline adjustments. Additional poll and poling average data can be found in our [polls dataset](https://github.com/fivethirtyeight/data/tree/master/polls). This sheet contains the following additional columns:

Column | Description
-------|------------
`candidate_name` | The candidate for this answer choice
`startdate` | The first day interviews were conducted for this poll
`enddate` | The last day interviews were conducted for this poll
`pollster` | The name of the pollster
`samplesize` | The size of the sample
`population` | Whether the population interviewed was adults, registered voters, or likely voters
`weight` | A relative weight that describes how much this poll factors into the forecast relative to other polls
`influence` | A relative weight that describes how much this poll factors into today's the forecast (similar to "weight", but also takes into account how old the poll is)
`pct` | Voteshare for this candidate in this poll
`house_adjusted_pct` | Voteshare in this poll after applying the house adjustment
`trend_and_house_adjusted_pct` | Voteshare in this poll after applying both house and trendline adjustments
`tracking` | Whether or not the poll sample overlaps with other polls in our database
`poll_id` | Unique identifier for a poll
`question_id` | Unique identifier for a question

`presidential_poll_averages_2020.csv` contains the polling averages for each day. Additional poll and poling average data can be found in our [polls dataset](https://github.com/fivethirtyeight/data/tree/master/polls). This sheet contains the following additional columns:

Column | Description
-------|------------
pct_estimate | Polling average for the candidate listed in `candidate_name` on `modeldate`
pct_trend_adjusted | Trendline adjusted polling average for the candidate listed in `candidate_name` on `modeldate`


`presidential_ev_probabilities_2020.csv` contains the forecasted chances of every possible Electoral College outcome. This sheet contains the following additional columns:


Column | Description
-------|------------
`evprob_inc` | Chance that the incumbent wins `total_ev` electoral votes
`evprob_chal` | Chance that the challenger wins `total_ev` electoral votes
`evprob_3rd` | Chance that the third-party candidate wins `total_ev` electoral votes
`total_ev` | Number of electoral votes in question

`presidential_scenario_analysis_2020.csv` contains the forecasted chances of various possible election outcome scenarios. This sheet contains the following additional columns:

Column | Description
-------|------------
`scenario_id` | A unique identifier for each scenario
`probability` | The forecasted chance that the scenario will happen
`scenario_description` | A description of the scenario in question


`economic_index.csv` contains economic indicators that serve as inputs to the forecast. For more information on these indicators, see [this post](https://fivethirtyeight.com/features/measuring-the-effect-of-the-economy-on-elections/). The economic indexes were collected from the [Federal Reserve Bank Of St. Louis]( https://fred.stlouisfed.org/series/DSPIC96) and the stock prices data from [Yahoo Finance](https://finance.yahoo.com/). This sheet contains the following additional columns:

Column | Description
-------|------------
`indicator` | Name of the economic indicator
`category` | What that indicator helps measure
`current_zscore` | Number of standard deviations from the previous 2-year average for the current value of the indicator
`projected_zscore` | Number of standard deviations from the previous 2-year average for the projected value of the indicator on Election Day
`projected_hi` | Upper bound of an 80% confidence interval for `projected_zscore`
`projected_lo` | Lower bound of an 80% confidence interval for `projected_zscore`


`forecast_steps.csv` contains the every intermediate step in calculating the chance of winning from the polling average in a particular state. This sheet contains the following additional columns:

Column | Description
-------|------------
`step_no` | A value from 1 - 10 where 1 is the starting point (Polling average) and 10 is the final step (Chance of winning).
`value_inc`, `value_chal`, `value_3rd` | The value of that step for the incumbent, challenger, and third party candidate
`weight` | The weight of the component when blending with either a regression or economic fundamentals
`step_description` | A description of each step in the process of calculating the chance of winning

`ec_vs_popvote.csv` contains the the probability that each candidate will win the electoral college conditional on the popular vote outcome. This sheet contains the following additional columns:

Column | Description
-------|------------
`lower_bin_text`, `upper_bin_text` | A range of popular vote outcomes
`total_ev_inc `, `ev_inc_lo`, `ev_inc_hi` | Forecasted number of Electoral College votes for the incumbent conditional on the popular vote outcome falling between `lower_bin_text` and `upper_bin_text`, including the upper and lower bounds of an 80% confidence interval
`total_ev_chal `, `ev_chal_lo`, `ev_chal_hi` | Forecasted number of Electoral College votes for the challenger conditional on the popular vote outcome falling between `lower_bin_text` and `upper_bin_text`, including the upper and lower bounds of an 80% confidence interval
`ecwin_inc`, `ecwin_chal`, `ecwin_3rd`, `ecwin_nomajority` | Chance that the incumbent, challenger, 3rd party candidate or nobody will win a majority of electoral votes, conditional on the popular vote outcome falling between `lower_bin_text` and `upper_bin_text`
`count` | Number of simulations in which this outcome is present



## Congressional Forecasts

`senate_national_toplines_2020.csv` contains the final national Senate topline on each day. This sheet contains the following additional columns:

Column | Description
-------|------------
`branch` | Kind of race this forecast pertains to (senate)
`expression` | Model type (lite, classic, or deluxe)
`forecastdate` | Date the model was run
`chamber_Dparty`, `chamber_Rparty` | Chance that each party (D or R) win control of the Senate
`mean_seats_Dparty`, `mean_seats_Rparty` | Average forecasted number of seats that each party (D or R) hold in the Senate
`median_seats_Dparty`, `median_seats_Rparty` | Median forecasted number of seats that each party (D or R) hold in the Senate
`p90_seats_Dparty`,`p90_seats_Rparty`,`p10_seats_Dparty`,`p10_seats_Rparty` | 90th and 10th percentile for the number of seats for each party (D or R)
`total_national_turnout`, `p90_total_national_turnout`, `p10_total_national_turnout` | Average, 90th percentile, and 10th percentile of national turnout in states with Senate races
`popvote_margin`, `p90_popvote_margin`, `p10_popvote_margin` | Average, 90th percentile, and 10th percentile of popular vote margin (with positive being more Democratic and negative more Republican) in Senate races

`house_national_toplines_2020.csv` contains the final national House topline on each day. This sheet contains the following additional columns:

Column | Description
-------|------------
`statesmajority_Dparty`, `statesmajority_Rparty`, `statesmajority_noparty` | Forecasted chances that each party, or no party, controls a majority of state delegations in the house
`delegations_Dparty`, `delegations_Rparty`, `delegations_nomajority` | How many state delegations each party is expected to control in the house

`senate_state_toplines_2020.csv` and `house_district_toplines_2020.csv` contain the final state-level Senate toplines and district-level House toplines on each day. These sheets contain the following additional columns:

Column | Description
-------|------------
`seat` | Senate seat corresponding to this row, in the format XX-S#, where XX is the state postal code and # is the class of the seat being contested
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

`senate_seat_distribution.csv` and `house_seat_distribution.csv` contain the probablity of each distribution of seats for each day's forecast run. These sheets contain the following additional columns:

Column | Description
-------|------------
`seatsheld` | number of seats held by each party
`seatprob_Dparty` | probability that Democrats will hold `seatsheld` number of seats
`seatprob_Rparty` | probability that Republicans will hold `seatsheld` number of seats


`senate_seat_distribution.csv` also contains the following additional columns:

Column | Description
-------|------------
`chamber_Dparty` | probability that each party will hold 50 seats and Democrats will control the Senate
`chamber_Rparty` | probability that each party will hold 50 seats and Republicans will control the Senate 


`senate_fundamentals.csv` and `house_fundamentals.csv` contain the fundamentals for each senate and house race. These sheets contain the following additional columns:

Column | Description
-------|------------
`component_no` | Number from 1 to 11 corresponding with each `component_name`
`component_name` | One of the following values `Incumbency`,`District partisanship`,`Incumbent's margin in last election`,`Generic ballot`,`Fundraising`,`Incumbent's voting record in Congress`,`Challenger experience`,`Scandals`,`Top-two primary margin`,`Number of candidates`,`Total`
`component_impact` | The impact each component has on the chances of winning
`component_narrative` | Narrative explanation of that component for a particular race
`genre` | Number of Democrats and Republicans running in a race. For example, `DR` means that there are one Democrat and one Republican in the race, while `DDR` means there are two Democrats and one Republican in the race
`candidateA`, `candidateB` | Full names of the first and second candidates in the race
`shortnmA`, `shortnmB` | Last names of the first and second candidates in the race

`senate_steps.csv` and `house_steps.csv` contain intermediate calculation steps performed in calculating the chance of winning from the polling average in a particular state. 

Column | Description
-------|------------
`displaystep` | A value from 1-4 indicating the order in which each calculation step is performed
`description` | A description of each step
`margin` | Forecasted margin in this step for `candidateA` - `candidateB`
`lite_weight`, `classic_weight`, `deluxe_weight` | Relatively how much of each forecast that is derived from each component during the calculation of this step
 
`joint_probabilities.csv` contains the probabilities of each possible combination of Democratic or Republican control of the Senate, House and Presidency

Column | Description
-------|------------
`expression` | `_lite`, `_classic` or `_deluxe`
`DsenateDhouseDpotus`, `DsenateRhouseDpotus`, `RsenateDhouseDpotus`, `RsenateRhouseDpotus`, `DsenateDhouseRpotus` , `DsenateRhouseRpotus` , `RsenateDhouseRpotus`, `RsenateRhouseRpotus` | Probability of each possible outcome for Democratic or Republican control of the Senate, House and Presidency

