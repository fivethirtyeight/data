# Historical NBA Elo

This directory contains the data behind the [Complete History Of The NBA](http://fivethirtyeight.com/interactives/the-complete-history-of-every-nba-team-by-elo) interactive. Data updated periodically. Game information is from [Basketball-Reference.com](http://www.basketball-reference.com/).

In the data file `nbaallelo.csv` are the following variables:

Header | Definition
---|---------
`gameorder` | Play order of game in NBA history
`game_id` | Unique ID for each game
`lg_id` | Which league the game was played in
`_iscopy` | Each row of data is tied to a single team for a single game, so _iscopy flags if this game_id has already occured for the opposing team in the same matchup
`year_id` | Season id, named based on year in which the season ended
`date_game` | Game date
`is_playoffs` | Flag for playoff games
`team_id` | Three letter code for team name, from Basketball Reference
`fran_id` | Franchise id. Multiple team_ids can fall under the same fran_id due to name changes or moves. Interactive is grouped by fran_id.
`pts` | Points scored by team
`elo_i` | Team elo entering the game
`elo_n` | Team elo following the game
`win_equiv` | Equivalent number of wins in a 82-game season for a team of elo_n quality
`opp_id` | Team id of opponent
`opp_fran` | Franchise id of opponent
`opp_pts` | Points scored by opponent
`opp_elo_i` | Opponent elo entering the game
`opp_elo_n` | Opponent elo following the game
`game_location` | Home (H), away (A), or neutral (N)
`game_result` | Win or loss for team in the team_id column
`forecast` | Elo-based chances of winning for the team in the team_id column, based on elo ratings and game location
`notes` | Additional information
