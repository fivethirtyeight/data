# FiveThirtyEight's Partisan Lean

This directory contains the data for FiveThirtyEight's partisan lean metric, or the average margin difference between how a state or district votes and how the country votes overall. Positive numbers mean Democratic leans, while negative numbers mean Republican leans.

This version of partisan lean, meant to be used for congressional and gubernatorial elections, is calculated as 50 percent the state or district’s lean relative to the nation in the most recent presidential election, 25 percent its relative lean in the second-most-recent presidential election and 25 percent a custom state-legislative lean based on the statewide popular vote in the four most recent state House elections. 

The current partisan leans are meant to be used for the 2022 midterm elections; they take election results through 2021 into account and correspond to the district lines as they stood after the 2021-22 redistricting process. The partisan leans in the “2021” folder were meant to be used for 2021-22 special elections; they take election results through 2020 into account and correspond to the district lines for the 117th Congress, before redistricting took place. Past partisan leans for the 2018 and 2020 election cycles are also available. Due to redistricting and changes in methodology, partisan leans are not comparable across years.


Column | Description
------|-------------------------
`state`/`district` | The state or district the partisan lean is calculated for. 
`2022` | Partisan lean index for the 2022 midterm elections, taking election results through 2021 into account and corresponding to post-redistricting congressional maps.
