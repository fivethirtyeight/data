# 2015 Women's World Cup Tournament Predictions

FiveThirtyEight's forecasts for the 2015 World Cup, including each team's WSPI rating and chance of advancing, updated throughout the course of the tournment. The date and time of each update are indicated in the file names. All times are in EDT.

#### Overall forecasts

Overall forecasts are stored in files named like `wwc-forecast-YYYYMMDD-HHMMSS.csv`.

Header | Definition
---|---------
`wspi` | Women's Soccer Power Index
`wspi_offense` | Women's Soccer Power Index offensive rating
`wspi_defense` | Women's Soccer Power Index defensive rating
`group_first` | Chance of coming in first place in the group stage
`group_second` | Chance of coming in second place in the group stage
`group_third_advance` | Chance of coming in third place in the group stage and advancing to the knockout stage
`group_third_no_advance` | Chance of coming in third place in the group stage but not advancing to the knockout stage
`group_fourth` | Chance of coming in fourth place in the group stage
`sixteen` | Chance of advancing to the knockout stage
`quarter` | Chance of advancing to the quarter finals
`semi` | Chance of advancing to the semi-finals
`cup` | Chance of making it to the final game
`win` | Chance of winning the whole thing

__Note:__ These probabilities are based on 20,000 simulations. A `win` probability of 0.0 doesn't necessarily mean that a team has a zero percent chance of winning the tournament -- it means that the team did not win the tournament in any of the 20,000 simulations.

#### Match probabilities

Individual match probabilities are stored in files named like `wwc-matches-YYYYMMDD-HHMMSS.csv`.

Header | Definition
---|---------
`team1_win` | The probability that team1 will beat team2
`team2_win` | The probability that team2 will beat team1
`tie` | The probability the game will end in a tie

For the Women's World Cup predictions interactive, [click here](http://projects.fivethirtyeight.com/womens-world-cup/).

For an explanation of WSPI, [click here](http://fivethirtyeight.com/features/how-our-womens-world-cup-model-works/).