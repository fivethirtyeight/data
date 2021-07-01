---
files:
  - https://projects.fivethirtyeight.com/wnba-api/wnba_elo.csv
  - https://projects.fivethirtyeight.com/wnba-api/wnba_elo_latest.csv
---
# WNBA Elo

This file contains links to the data behind our [WNBA Predictions](https://projects.fivethirtyeight.com/2021-wnba-predictions/). More information on how our WNBA Elo model works can be found in [this article](https://fivethirtyeight.com/methodology/how-our-wnba-predictions-work/).

`wnba_elo.csv` contains game-by-game Elo ratings and forecasts since 1997.

`wnba_elo_latest.csv` contains game-by-game Elo ratings and forecasts for only the latest season.


Column | Definition
-----| ---------
season | Year of season
date | Date of game
playoff | Whether game was in playoffs
neutral | Whether game was on a neutral site
status | `post` if the game already happened; `pre` if it hasn't happened yet; `live` if it is being played at the time of data export
home_team | Home team name
away_team | Away team name
home_team_abbr | Home team abbreviation. Multiple team names can fall under the same team_abbr because of name changes or moves. Interactive is grouped by team_abbr.
away_team_abbr | Away team abbreviation. Multiple team names can fall under the same team_abbr because of name changes or moves. Interactive is grouped by team_abbr.
home_team_pregame_rating | Home team's Elo rating before the game
away_team_pregame_rating | Away team's Elo rating before the game
home_team_winprob | Home team's probability of winning according to team ratings
away_team_winprob | Away team's probability of winning according to team ratings
home_team_score | Home team's score (will be blank for `pre` and `live` games)
away_team_score | Away team's score (will be blank for `pre` and `live` games)
home_team_postgame_rating | Home team's rating after the game (will be blank for `pre` and `live` games)
away_team_postgame_rating | Away team's rating after the game (will be blank for `pre` and `live` games)
