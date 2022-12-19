---
files:
  - https://projects.fivethirtyeight.com/soccer-api/club/spi_matches.csv
  - https://projects.fivethirtyeight.com/soccer-api/club/spi_matches_latest.csv
  - https://projects.fivethirtyeight.com/soccer-api/club/spi_global_rankings.csv
  - https://projects.fivethirtyeight.com/soccer-api/international/spi_matches_intl.csv
  - https://projects.fivethirtyeight.com/soccer-api/international/spi_global_rankings_intl.csv
---
# SPI Ratings

This file contains links to the data behind our [Club Soccer Predictions](https://projects.fivethirtyeight.com/soccer-predictions/) and [Global Club Soccer Rankings](https://projects.fivethirtyeight.com/global-club-soccer-rankings/).

## Match files

`spi_matches.csv` contains match-by-match SPI ratings and forecasts back to 2016.

`spi_matches_latest.csv` contains match-by-match SPI ratings and forecasts for each league's latest season.

`spi_matches_intl.csv` contains match-by-match SPI ratings and forecasts for international leagues.

The headers for the `_matches` files are:

Header | Definition
---|---------
`season` | The season during which the match was played
`date` | The date of the match (YYYY-MM-DD)
`league_id` | A unique identifier for the league this match was played in
`league` | The name of the league this match was played in
`team1` | The home team's name
`team2` | The away team's name
`spi1` | The home team's overall SPI rating before the match
`spi2` | The away team's overall SPI rating before the match
`prob1` | The probability of the home team winning the match
`prob2` | The probability of the away team winning the match
`probtie` | The probability of match ending in a draw (if applicable)
`proj_score1` | The number of goals we expected the home team to score
`proj_score2` | The number of goals we expected the away team to score
`importance1` | The importance of the match for the home team (0-100)
`importance2` | The importance of the match for the away team (0-100)
`score1` | The number of goals scored by the home team
`score2` | The number of goals scored by the away team
`xg1` | The number of expected goals created by the home team
`xg2` | The number of expected goals created by the away team
`nsxg1` | The number of non-shot expected goals created by the home team
`nsxg2` | The number of non-shot expected goals created by the away team
`adj_score1` | The number of goals scored by the home team, adjusted for game state
`adj_score2` | The number of goals scored by the home team, adjusted for game state

See [how our club soccer predictions work](https://fivethirtyeight.com/methodology/how-our-club-soccer-predictions-work/) for more information on these fields.

## Global ranking files

`spi_global_rankings.csv` contains current SPI ratings and rankings for men's club teams.

`spi_global_rankings_intl.csv` contains current SPI ratings and rankings for men's international teams.

The headers for the `_global_rankings` files are:

Header | Definition
---|---------
`rank` | The team's current global ranking
`prev_rank` | The team's global ranking a week ago
`name` | The team's name
`league` | The league the team plays in
`off` | The team's offensive SPI rating
`def` | The team's defensive SPI rating
`spi` | The team's overall SPI rating