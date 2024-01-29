# Bachelorette / Bachelor

This folder contains the data behind the stories:

- [How To Spot A Front-Runner On The ‘Bachelor’ Or ‘Bachelorette’](https://fivethirtyeight.com/features/the-bachelorette/)
- [Rachel’s Season Is Fitting Neatly Into ‘Bachelorette’ History](https://fivethirtyeight.com/features/rachels-season-is-fitting-neatly-into-bachelorette-history/)
- [Rachel Lindsay’s ‘Bachelorette’ Season, In Three Charts](https://fivethirtyeight.com/features/rachel-lindsays-bachelorette-season-in-three-charts/)

Data was scraped from the [Bachelor Nation Wiki](http://bachelor-nation.wikia.com/wiki/Bachelor_Nation_Wikia) and then missing seasons were filled in by ABC and FiveThirtyEight staffers.

Header          | Description
----------------|------------
`SHOW`          | Bachelor or Bachelorette
`SEASON`        | Which season
`CONTESTANT`    | An identifier for the contestant in a given season
`ELIMINATION-1` | Who was eliminated in week 1
`ELIMINATION-2` | Who was eliminated in week 2
`ELIMINATION-3` | Who was eliminated in week 3
`ELIMINATION-4` | Who was eliminated in week 4
`ELIMINATION-5` | Who was eliminated in week 5
`ELIMINATION-6` | Who was eliminated in week 6
`ELIMINATION-7` | Who was eliminated in week 7
`ELIMINATION-8` | Who was eliminated in week 8
`ELIMINATION-9` | Who was eliminated in week 9
`ELIMINATION-10`| Who was eliminated in week 10
`DATES-1`       | Who was on which date in week 1
`DATES-2`       | Who was on which date in week 2
`DATES-3`       | Who was on which date in week 3
`DATES-4`       | Who was on which date in week 4
`DATES-5`       | Who was on which date in week 5
`DATES-6`       | Who was on which date in week 6
`DATES-7`       | Who was on which date in week 7
`DATES-8`       | Who was on which date in week 8
`DATES-9`       | Who was on which date in week 9
`DATES-10`      | Who was on which date in week 10

- Eliminates connote either an elimination (starts with "E") or a rose (starts with "R").
- Eliminations supercede roses.
- "E" connotes a standard elimination, typically at a rose ceremony. "EQ" means the contestant quits. "EF" means the contestant was fired by production. "ED" connotes a date elimination. "EU" connotes an unscheduled elimination, one that takes place at a time outside of a date or rose ceremony.
- "R" means the contestant received a rose. "R1" means the contestant got a first impression rose.
- "D1" means a one-on-one date, "D2" means a 2-on-1, "D3" means a 3-on-1 group date, and so on.
- Weeks of the show are deliminated by rose ceremonies, and may not line up exactly with episodes.
