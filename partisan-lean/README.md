# FiveThirtyEight's Partisan Lean

This directory contains the data for FiveThirtyEight's partisan lean metric, or the average margin difference between how a state or district votes and how the country votes overall. Positive numbers mean Democratic leans, while negative numbers mean Republican leans.

This version of partisan lean, meant to be used for congressional and gubernatorial elections, is calculated as 50 percent the state or district’s lean relative to the nation in the most recent presidential election, 25 percent its relative lean in the second-most-recent presidential election and 25 percent a custom state-legislative lean based on the statewide popular vote in the four most recent state House elections. Presidential results by congressional district were calculated by [Daily Kos Elections](https://www.dailykos.com/stories/2020/11/19/1163009/-Daily-Kos-Elections-presidential-results-by-congressional-district-for-2020-2016-and-2012). 

Due to redistricting and changes in methodology, partisan leans are not comparable across years. Additionally, the current congressional-district partisan leans in every state except Alaska, Delaware, North Dakota, South Dakota, Vermont and Wyoming are not applicable to the 2022 election because they do not take into account the 2021-22 redistricting process.


Column | Description
------|-------------------------
`state`/`district` | The state or district the partisan lean is calculated for. 
`2021` | Partisan lean as it stands after the 2020 election, taking the 2020 results into account. For congressional districts, scores correspond to the district lines for the 117th Congress and do not reflect the results of the 2021-22 redistricting process.

