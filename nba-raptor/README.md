# nba-raptor

This folder contains data behind the story [Introducing RAPTOR, Our New Metric For The Modern NBA](https://fivethirtyeight.com/features/introducing-raptor-our-new-metric-for-the-modern-nba)

`modern_RAPTOR_by_player.csv` contains the RAPTOR data for every player broken out by season since 2014, when NBA player-tracking data first became available. 

`modern_RAPTOR_by_team.csv` contains RAPTOR data for every player broken out by team, season and season_type since 2014, when NBA player-tracking data first became available.

These "modern" data files contain the box score and on/off plus-minus components of RAPTOR, which are then combined into a total RAPTOR rating.


`historical_RAPTOR_by_player.csv` contains the RAPTOR data for every player broken out by season since the 1976 ABA-NBA merger.


`historical_RAPTOR_by_team.csv` contains RAPTOR data for every player broken out by team, season and season_type since the 1976 ABA-NBA merger. 

These "historical" data files use full player-tracking RAPTOR for seasons since 2014, a version of RAPTOR that mixes box score value estimates with single-year regularized plus-minus data for seasons from 2001 through 2013, and a version of RAPTOR that only uses a box score estimate of value for the seasons from 1977 through 2000. In each era, the RAPTOR version with the highest level of detail is the version used.


Column | Description
-------|---------------
`player_name` |	Player name
`player_id` |	Basketball-Reference.com player ID
`season` |	Season
`season_type` |	Regular season (RS) or playoff (PO)
`team` |	Basketball-Reference ID of team
`poss` |	Possessions played
`mp` |	Minutes played
`raptor_box_offense` |	Points above average per 100 possessions added by player on offense, based only on box score estimate
`raptor_box_defense` |	Points above average per 100 possessions added by player on defense, based only on box score estimate
`raptor_box_total` |	Points above average per 100 possessions added by player, based only on box score estimate
`raptor_onoff_offense` |	Points above average per 100 possessions added by player on offense, based only on plus-minus data
`raptor_onoff_defense` |	Points above average per 100 possessions added by player on defense, based only on plus-minus data
`raptor_onoff_total` |	Points above average per 100 possessions added by player, based only on plus-minus data
`raptor_offense` |	Points above average per 100 possessions added by player on offense, using both box and on-off components
`raptor_defense` |	Points above average per 100 possessions added by player on defense, using both box and on-off components
`raptor_total` |	Points above average per 100 possessions added by player on both offense and defense, using both box and on-off components
`war_total` |	Wins Above Replacement between regular season and playoffs
`war_reg_season` |	Wins Above Replacement for regular season
`war_playoffs` |	Wins Above Replacement for playoffs
`predator_offense` |	Predictive points above average per 100 possessions added by player on offense
`predator_defense` |	Predictive points above average per 100 possessions added by player on defense
`predator_total` |	Predictive points above average per 100 possessions added by player on both offense and defense
`pace_impact` |	Player impact on team possessions per 48 minutes
