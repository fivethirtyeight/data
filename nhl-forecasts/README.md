---
files:
  - https://projects.fivethirtyeight.com/nhl-api/nhl_elo.csv
  - https://projects.fivethirtyeight.com/nhl-api/nhl_elo_latest.csv
---
# NHL Elo

This file contains links to the data behind our [NHL Predictions](https://projects.fivethirtyeight.com/2022-nhl-predictions/). More information on how our NHL Elo model works can be found in [this article](https://fivethirtyeight.com/methodology/how-our-nhl-predictions-work/).

`nhl_elo.csv` contains game-by-game Elo ratings and forecasts since the NHL's inaugural 1917-18 season.

`nhl_elo_latest.csv` contains game-by-game Elo ratings and forecasts for only the latest NHL season.


Column | Definition
-----| ---------
season | Year of season
date | Date of game
playoff | Whether game was a playoff game
neutral | Whether game was played at a neutral site
status | `post` if the game already happened; `pre` if it hasn't happened yet; `live` if it is being played at the time of data export
ot | Overtime status: `OT` if the game ended in overtime, `SO` if the game ended in a shootout, blank if the game ended in regulation or if the game hasn't happened yet (will be blank for `pre` and `live` games). Games that went into multiple overtimes have the number of overtimes listed before `OT`: `2OT`, `3OT`, etc.
home_team | Home team name
away_team | Away team name
home_team_abbr | Home team abbreviation. Multiple team names can fall under the same team_abbr because of name changes or moves. Interactive is grouped by team_abbr.
away_team_abbr | Away team abbreviation. Multiple team names can fall under the same team_abbr because of name changes or moves. Interactive is grouped by team_abbr.
home_team_pregame_rating | Home team's Elo rating before the game
away_team_pregame_rating | Away team's Elo rating before the game
home_team_winprob | Home team's probability of winning according to team pregame ratings
away_team_winprob | Away team's probability of winning according to team pregame ratings
overtime_prob | Probability that the game ends in overtime according to team pregame ratings (including shootouts)
home_team_expected_points | Home team's expected points earned at the time the game started, according to team pregame ratings (2 points for a win, 1 point for a loss in overtime)
away_team_expected_points | Away team's expected points earned at the time the game started, according to team pregame ratings (2 points for a win, 1 point for a loss in overtime or shootout)
home_team_score | Home team's score (will be blank for `pre` and `live` games)
away_team_score | Away team's score (will be blank for `pre` and `live` games)
home_team_postgame_rating | Home team's rating after the game (will be blank for `pre` and `live` games)
away_team_postgame_rating | Away team's rating after the game (will be blank for `pre` and `live` games)
game_quality_rating | Rating of game's quality, based on the harmonic mean of the teams’ pregame Elo ratings, scaled from 0-100
game_importance_rating | Rating of game's importance, based on how much the result would affect the model's forecasted playoff odds, scaled from 0-100. For `post` games, this rating is as of when the game started. (will be blank for all games played prior to 2021-22 season, the year we added a NHL forecast)
game_overall_rating | The average of `game_quality_rating` and `game_importance_rating` (will be blank for all games played prior to 2021-22 season, the year we added a NHL forecast)
