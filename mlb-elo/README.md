---
files:
  - https://projects.fivethirtyeight.com/mlb-api/mlb_elo.csv
---
# MLB Elo

This file contains links to the data behind [The Complete History Of MLB](https://projects.fivethirtyeight.com/complete-history-of-mlb/) and our [MLB Predictions](https://projects.fivethirtyeight.com/2018-mlb-predictions/).

`mlb_elo.csv` contains game-by-game Elo ratings and forecasts back to 1871.

The data contains two separate systems for rating teams; the simpler Elo ratings, used for [The Complete History Of MLB](https://projects.fivethirtyeight.com/complete-history-of-mlb/), and the more involved — and confusingly named — "ratings" that are used in our [MLB Predictions](https://projects.fivethirtyeight.com/2018-mlb-predictions/). The main difference is that Elo ratings are reverted to the mean between seasons, while the more involved ratings use preseason team projections from several projection systems and account for starting pitchers. More information can be found in [this article](https://fivethirtyeight.com/features/how-our-mlb-predictions-work/).

Column | Definition
-----| ---------
date | Date of game
season | Year of season
neutral | Whether game was on a neutral site
playoff | Whether game was in playoffs, and the playoff round if so
team1 | Abbreviation for home team
team2 | Abbreviation for away team
elo1_pre | Home team's Elo rating before the game
elo2_pre | Away team's Elo rating before the game
elo_prob1 | Home team's probability of winning according to Elo ratings
elo_prob2 | Away team's probability of winning according to Elo ratings
elo1_post | Home team's Elo rating after the game
elo2_post | Away team's Elo rating after the game
rating1_pre | Home team's rating before the game
rating2_pre | Away team's rating before the game
pitcher1 | Name of home starting pitcher
pitcher2 | Name of away starting pitcher
pitcher1_rgs | Home starting pitcher's rolling game score before the game
pitcher2_rgs | Away starting pitcher's rolling game score before the game
pitcher1_adj | Home starting pitcher's adjustment to their team's rating
pitcher2_adj | Away starting pitcher's adjustment to their team's rating
rating_prob1 | Home team's probability of winning according to team ratings and starting pitchers
rating_prob2 | Away team's probability of winning according to team ratings and starting pitchers
rating1_post | Home team's rating after the game
rating2_post | Away team's rating after the game
score1 | Home team's score
score2 | Away team's score
