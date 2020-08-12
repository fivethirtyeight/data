---
files:
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_national_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_state_toplines_2020.csv
 - https://projects.fivethirtyeight.com/2020-general-data/presidential_ev_probabilities_2020.csv
---

# election-forecasts-2020

This file contains links to the data behind our [2020 General Election Forecast](https://projects.fivethirtyeight.com/2020-election-forecast/).


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
`nat_voteshare_other`, `nat_voteshare_other_lo`, `nat_voteshare_other_hi` | Forecasted national vote share for all the other candidates, including the upper and lower bounds of an 80% confidence interval
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


`presidential_ev_probabilities_2020.csv` contains the forecasted chances of every possible Electoral College outcome. This sheet contains the following additional columns:


Column | Description
-------|------------
`evprob_inc` | Chance that the incumbent wins `total_ev` electoral votes
`evprob_chal` | Chance that the challenger wins `total_ev` electoral votes
`evprob_3rd` | Chance that the third-party candidate wins `total_ev` electoral votes
`total_ev` | Number of electoral votes in question
