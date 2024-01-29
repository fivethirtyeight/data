# foul-balls
 
This folder contains the data behind the story [We Watched 906 Foul Balls To Find Out Where The Most Dangerous Ones Land](https://fivethirtyeight.com/features/we-watched-906-foul-balls-to-find-out-where-the-most-dangerous-ones-land/).
 
`foul-balls.csv` contains 906 foul balls collected from the most foul-heavy day at each of the the 10 stadiums that produced the most foul balls, as of June 5, 2019. Batted-ball data is from [Baseball Savant](https://baseballsavant.mlb.com/statcast_search?hfPT=&hfAB=&hfBBT=&hfPR=foul%7C&hfZ=&stadium=&hfBBL=&hfNewZones=&hfGT=R%7C&hfC=&hfSea=2019%7C&hfSit=&player_type=pitcher&hfOuts=&opponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=&game_date_lt=2019-06-05&hfInfield=&team=&position=&hfOutfield=&hfRO=&home_road=&hfFlag=&hfPull=&metric_1=&hfInn=&min_pitches=0&min_results=0&group_by=venue&sort_col=pitches&player_event_sort=h_launch_speed&sort_order=desc&min_pas=0#results). 
 
Column | Description
-------|-------------
`matchup` | The two teams that played
`game_date`| Date of the most foul-heavy day at each stadium
`type_of_hit` | Fly, grounder, line drive, pop up or batter hits self
`exit_velocity` | Recorded exit velocity of each hit -- blank if not provided
`predicted_zone` | The zone we predicted the foul ball would land in by gauging angles
`camera_zone` | The zone that the foul ball landed in, confirmed by footage
`used_zone` | The zone used for analysis 
 
