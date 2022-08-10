# What If Democrats — Or Republicans — Had Won Every Redistricting Battle?

This repo contains the data behind the story [What If Democrats — Or Republicans — Had Won Every Redistricting Battle?](https://projects.fivethirtyeight.com/redistricting-alternate-maps/). There is one csv file in this repo: `redistricting-alternate-maps.csv`.

Header | Definition
--- | ---
`state_abbr` | Two-letter state abbreviation.
`state_name` | Full state name.
`rep_map` | Link to the most Republican-favorable map proposed in the 2020 census redistricting cycle in this state, as analyzed in [FiveThirtyEight's Redistricting Tracker](https://projects.fivethirtyeight.com/redistricting-2022-maps/).
`rep_map_r_districts` | Number of Republican-leaning districts in the most Republican-favored proposed map.
`rep_map_d_districts` | Number of Democratic-leaning districts in the most Republican-favored proposed map.
`rep_map_c_districts` | Number of highly competitive districts in the most Republican-favored proposed map.
`rep_map_avg_r_chances` | Mean of Republicans' odds of winning each district in the most Republican-favored proposed map.
`rep_map_avg_d_chances` | Mean of Democrats' odds of winning each district in the most Republican-favored proposed map.
`rep_map_median_pvi` | Difference between the partisan lean of the most Republican-favored proposed map’s median district and the partisan lean of the state as a whole. Values more favorable to Democrats are coded as positive; values more favorable to Republicans are coded as negative.
`dem_map` | Link to the most Democratic-favorable map proposed in the 2020 census redistricting cycle in this state, as analyzed in [FiveThirtyEight's Redistricting Tracker](https://projects.fivethirtyeight.com/redistricting-2022-maps/).
`dem_map_r_districts` | Number of Republican-leaning districts in the most Democratic-favored proposed map.
`dem_map_d_districts` | Number of Democratic-leaning districts in the most Democratic-favored proposed map.
`dem_map_c_districts` | Number of highly competitive districts in the most Democratic-favored proposed map.
`dem_map_avg_r_chances` | Mean of Republicans' odds of winning each district in the most Democratic-favored proposed map.
`dem_map_avg_d_chances` | Mean of Democrats' odds of winning each district in the most Democratic-favored proposed map.
`dem_map_median_pvi` | Difference between the partisan lean of the most Democratic-favored proposed map’s median district and the partisan lean of the state as a whole. Values more favorable to Democrats are coded as positive; values more favorable to Republicans are coded as negative.
`com_map` | Link to the most competitive map proposed in the 2020 census redistricting cycle in this state, as analyzed in [FiveThirtyEight's Redistricting Tracker](https://projects.fivethirtyeight.com/redistricting-2022-maps/).
`com_map_r_districts` | Number of Republican-leaning districts in the most competitive proposed map.
`com_map_d_districts` | Number of Democratic-leaning districts in the most competitive proposed map.
`com_map_c_districts` | Number of highly competitive districts in the most competitive proposed map.
`com_map_avg_r_chances` | Mean of Republicans' odds of winning each district in the most competitive proposed map.
`com_map_avg_d_chances` | Mean of Democrats' odds of winning each district in the most competitive proposed map.
`com_map_median_pvi` | Difference between the partisan lean of the most competitive proposed map’s median district and the partisan lean of the state as a whole. Values more favorable to Democrats are coded as positive; values more favorable to Republicans are coded as negative.
