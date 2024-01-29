# NFL Wide Receivers

This folder contains data behind the story [The Football Hall Of Fame Has A Receiver Problem](http://fivethirtyeight.com/features/the-football-hall-of-fame-has-a-receiver-problem/).

`advanced-historical.csv` contains advanced career stats for NFL receivers, 1932-2013.

Header | Definition
---|---------
`pfr_player_id` | Player identification code at Pro-Football-Reference.com
`player_name` | The player's name
`career_try` | Career True Receiving Yards
`career_ranypa` | Adjusted Net Yards Per Attempt (relative to average) of player's career teams, weighted by TRY w/ each team
`career_wowy` | The amount by which career_ranypa exceeds what would be expected from his QBs' (age-adjusted) performance without the receiver
`bcs_rating` | The number of yards per game by which a player would outgain an average receiver on the same team, after adjusting for teammate quality and age (update of http://www.sabernomics.com/sabernomics/index.php/2005/02/ranking-the-all-time-great-wide-receivers/)

`try-per-game-aging-curve.csv` contains receiver aging curve definitions.

Header | Definition
---|---------
`age_from` | The age (as of December 31st) the player is moving from
`age_to` | The age (as of December 31st) the player is moving to
`trypg_change` | Expected change in TRY/game from one age-season to the next
