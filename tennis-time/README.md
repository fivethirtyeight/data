# Tennis Time

This folder contains data behind the story [Why Some Tennis Matches Take Forever](http://fivethirtyeight.com/features/why-some-tennis-matches-take-forever).

`serve_times.csv`

Header | Definition
--- | ---
`server` | Name of player serving at 2015 French Open
`seconds_before_next_point` | Time in seconds between end of marked point and next serve, timed by stopwatch app
`day` | Date
`opponent` | Opponent, receiving serve
`game_score` | Score in the current game during the timed interval between points
`set` | Set number, out of five
`game` | Score in games within the set

`players_time.csv`

Header | Definition
--- | ---
`player` | Player name
`seconds_added_per_point` | Weighted average of seconds added per point as loser and winner of matches, 1991-2015, from regression model controlling for tournament, surface, year and other factors

`events_time.csv`

Header | Definition
--- | ---
`tournament` | Name of event
`surface` | Court surface used at the event
`seconds_added_per_point` | Seconds added per point for this event on this surface in years shown, from regression model controlling for players, year and other factors
`years` | Start and end years for data used from this tournament in regression
